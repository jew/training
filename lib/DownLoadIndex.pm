package DownLoadIndex;
use strict;
use warnings;
use Moose;
use LWP::UserAgent;
use File::Slurp ;

has 'url' => ( is => 'rw', isa => 'Str', required => 1, );
has '_ua' => ( is => 'ro', isa => 'LWP::UserAgent', lazy_build => 1, );
has 'content' => ( is => 'ro', isa => 'ArrayRef', lazy_build => 1, );
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
sub write_to_file {
    my ($self, $filename) = @_;
    my @content = @{$self->content};

    my $output = "";
    foreach my $h (@content) {
        $output .= $h->{name} . "-" . $h->{value} .",". "\n";
    }
    write_file($filename,{binmode => ':utf8'},$output);
}   
sub update_index {
    my ($self, $filename) = @_;


# #open resault.txt and read line and compare 
            open(MYINPUTFILE, "<results.txt");
             my @lines = split /\n/,$_;
             foreach my $line (@lines) {
             print "EX-VALUE OF INDEX  :" @lines[$line];
            
             }
#            while(<MYINPUTFILE>)
#             {
#             my($line) = $_;
#                #my @lines = split /\,/,$_;
#            chomp($line);
#             print "EX-VALUE OF INDEX  :$line\n";
#             }


#    my @content = @{$self->content};
#    my $u_index = "";
#    foreach my $h (@content) {
#        
#        $u_index = $h->{name} . "-" . $h->{value} .",". "\n";
#         print"UPDATE VALUE:$u_index\n";
#        
#        
#    }



}

1;
=head2 _build__au
    
=cut
