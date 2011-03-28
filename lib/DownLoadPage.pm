package DownLoadPage;
use strict;
use warnings;
use Moose;
use LWP::UserAgent;
use File::Slurp ;

has 'url' => ( is => 'rw', isa => 'Str', required => 1, );
has '_ua' => ( is => 'ro', isa => 'LWP::UserAgent', lazy_build => 1, );
my $decode1;
my $counter = 0;
sub _build__ua {
    my ($self) = @_;
    return LWP::UserAgent->new;
}
sub download_to_memory {
    if($counter==0) {
        my ($self) = @_;
        my $response = $self->_ua->get($self->url);
        my $counter1 ++; 
        my $decode = $response->decoded_content;
        $decode1= $decode;
        return $decode1;
    }
    else {
        return $decode1;
    }
}
sub write_to_file {
    my ($self, $filename) = @_;
    my $text = $decode1;
    write_file($filename,{binmode => ':utf8'},$text);
}
sub download_to_file {
   my ($self, $filename) = @_;
   if($counter==1) {
        $self->write_to_file($filename);
   }
   else {
       $self->download_to_memory;
       $self->write_to_file($filename);
   }
}
1;
=head2 _build__au
    
=cut
