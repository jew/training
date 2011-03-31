#!/usr/bin/perl
use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";
use DownLoadIndex;
use Data::Dumper;
my $url ='http://www.nasdaq.com/';
my $filename = 'results.txt';
my $dlp = DownLoadIndex->new(url => $url);
print "Index\n";
#print Dumper($dlp->content);
#print  Dumper($dlp->content->[0]->{name}) ;
#my $size = @{ $dlp->content };
#print "MY SIZE : $size"
if($dlp->write_to_file($filename)==1) {
    print "SAVE FILE : OK\n";
}
else {
    print "Can not write";
}
$dlp->update_index;
