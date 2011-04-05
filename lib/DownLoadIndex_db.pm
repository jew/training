package DownLoadIndex_db;
use strict;
use warnings;
use Moose;
use LWP::UserAgent;
use Data::Dumper;
use DBI;
use Indexsvalue::Schema;
has 'db'        =>  ( is =>'ro' , isa => 'Indexsvalue::Schema',  lazy_build => 1, );
has 'url'       =>  ( is => 'rw', isa => 'Str',                 required   => 1, );
has '_ua'       =>  ( is => 'ro', isa => 'LWP::UserAgent',      lazy_build => 1, );
has 'content'   =>  ( is => 'ro', isa => 'ArrayRef',            lazy_build => 1, );


sub _build_db {
    my ($self) = @_;
    my $connect = Indexsvalue::Schema->connect("dbi:SQLite:test.sqlite");
    return $connect;
}
sub _build__ua {
    my ($self) = @_;
    return LWP::UserAgent->new;
}
sub _build_content {
    my ($self) = @_;
    my $response = $self->_ua->get($self->url);
    my $text     = $response->decoded_content;      
    my @all;
    my @lines = split /\n/,$text;
    foreach my $line (@lines) {
        if( $line =~ /setIndexInfo\(\"([\w\s\d\-&\*]+)\",\"([\d\.]+)\"\,.+\)/ ) {
            my $name   = $1;
            my $value  = $2;
            my %result = ( name => $name, value => $value );
            push( @all, \%result ); 
        }
    }
    return \@all; 
}  
sub insert_to_database {
    my ($self)  = @_;
    my @content = @{$self->content};
    my $db =$self->db;
    foreach my $h (@content) {
    $db->resultset('Stocks')->update_or_create(
         {
          name => $h->{name},
          value =>$h->{value},       
        }, 
        { key => "name" } 
         );  
    } 
}
13;

=head2 _build__au 
    _build__au is a subroutine that return LWP::UserAgent object
=cut
=head2 _build_db
    _build__db is a subroutine that return  a value that connect to dbi:SQLite:test.sqlite
=cut
=head2 _build_content
    _build_content is a subroutine get value from url ,decode and get 2 variables($name and $value) from  content  and store $name and $value in \@all
=cut
=head2 insert_to_database
    insert_to_database is a subroutine that check value of stocks from the website compare to the stock value from database ,if the stock values from the database has changed 
    will update to the databse 
=cut

