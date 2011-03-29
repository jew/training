package DownLoadPage;
use strict;
use warnings;
use Moose;
use LWP::UserAgent;
use File::Slurp ;

has 'url' => ( is => 'rw', isa => 'Str', required => 1, );
has '_ua' => ( is => 'ro', isa => 'LWP::UserAgent', lazy_build => 1, );
has 'content' => ( is => 'ro', isa => 'Str', lazy_build => 1, );
sub _build__ua {
    my ($self) = @_;
    return LWP::UserAgent->new;
}
sub _build_content {
    my ($self) = @_;
    my $response = $self->_ua->get($self->url);
    my $text = $response->decoded_content;
    return $text;
}
sub download_to_memory {
    my ($self) = @_;
    return $self->content;
}
sub write_to_file {
    my ($self, $filename) = @_;
    my $text = $self->content;
    write_file($filename,{binmode => ':utf8'},$text);
}
1;
=head2 _build__au
    
=cut
