package DownLoadIndex;
use strict;
use warnings;
use Moose;
use LWP::UserAgent;
use File::Slurp ;
use Data::Dumper;
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
sub update_index{
    my ($self)   = @_;
    my $filename = 'results3.txt';     
    my $text     = read_file( $filename ) ;
    my @lines    = split /\,/,$text;
    my $no=$#lines-1;
    my @all;
    my $is_changed = 0;
    # get values from file 
    for (my $i = 0; $i<=$no ;$i++) {
        $lines[$i] =~/([\w\s\d\-&\*]+)\-([\d\.]+)/;
        my $fname=$1;
        my $fvalue=$2;
        #get from web
        my @content = @{$self->content};
        my $new_v = "";          
        my $line_w = $content[$i];
        $fname =~ s/^\s+//;#remove space
            if (($content[$i]->{name} eq $fname)&&($content[$i]->{value} eq $fvalue)) {           
                push( @all, { name => $content[$i]->{name} , value => $content[$i]->{value} } );
            }
            else {
                $is_changed = 1;
                push( @all, { name => $content[$i]->{name} , value => $content[$i]->{value} } );
            }   
        }
    my @content = @{$self->content};
    my $output = "";
        foreach my $h (@all) {
            $output .= $h->{name} . "-" . $h->{value} .",". "\n";
        }
    if ( $is_changed ) {
       write_file($filename,{binmode => ':utf8'},$output);
    }  
}
1;
=head2 _build__au
    
=cut
