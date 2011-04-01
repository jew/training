#!/usr/bin/perl
use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";
use DownLoadIndex;
use Data::Dumper;
my $url ='http://www.nasdaq.com/';
my $filename = 'results3.txt';
my $dlp = DownLoadIndex->new(url => $url);
$dlp->content;
if($dlp->write_to_file($filename)==1) {
    print "SAVE FILE : OK\n";
}
else {
    print "Can not write";
}
if($dlp->update_index==1) {
    print "UPDATE and SAVE TO result.txt : OK\n";
}
else {
    print "Can not ";
}
