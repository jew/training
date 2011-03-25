#!/usr/bin/perl
use strict;
use warnings;

use DownLoadPage;

my $url = $ARGV[0];
my $dlp = DownLoadPage->new(url => $url);

print "Your page: \n";
print $dlp->download_to_memory;
print "\n";
