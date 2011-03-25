package DownLoadPage;
use strict;
use warnings;
use Moose;
use LWP::UserAgent;

has 'url' => ( is => 'rw', isa => 'Str', required => 1, );
has '_ua' => ( is => 'ro', isa => 'LWP::UserAgent', lazy_build => 1, );

sub _build__ua {
    my ($self) = @_;
    return LWP::UserAgent->new;
}

sub download_to_memory {
    my ($self) = @_;
    return $self->url;
}
1;
=head2 DownLoadPage
    DownLoadPage() is a subroutine that use for downloading page.
=cut
