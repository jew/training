package DownLoadPage;
use strict;
use warnings;
use Moose;
use LWP::UserAgent;
use File::Slurp ;

has 'url' => ( is => 'rw', isa => 'Str', required => 1, );
has '_ua' => ( is => 'ro', isa => 'LWP::UserAgent', lazy_build => 1, );

sub _build__ua {
    my ($self) = @_;
    return LWP::UserAgent->new;
}

sub download_to_memory {
    my ($self) = @_;
    my $response = $self->_ua->get($self->url);
    my $decode = $response->decoded_content;
    return $decode;
}
sub write_to_file {
    my ($self, $filename) = @_;
    my $text = $self->download_to_memory;
    write_file($filename,{binmode => ':utf8'},$text);
}
sub download_to_file {
    my ($self, $filename) = @_;
    if(&download_to_memory ne '') {
        $self->download_to_memory;
        $self->write_to_file($filename);
    }
    else {
        $self->write_to_file($filename);
    }   
}
1;
=head2 DownLoadPage
    
=cut
