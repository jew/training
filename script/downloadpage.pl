#!/usr/bin/perl
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";
use DownLoadPage;

my $url = $ARGV[0];
my $filename = $ARGV[1];
print "URL IS :$url\n";
if(($url) ne ('')) {
    my $dlp = DownLoadPage->new(url => $url);
    print "Your page: \n";
    print $dlp->content;
    print "build content";
    print "\n";
    if($dlp->download_to_memory ne '') {
        print "Downloading successfull";
    }
    else {
        print " Not Successfull";
    }
    print "\n";
    if($dlp->write_to_file($filename)==1) {
        print "SAVE FILE : OK\n";
    }
    else {
        print "Can not write";
    }         
}
else {
    print "please assign url and file name /n";
    print "Example : perl script/downloadpage.pl http://www.hunsa.com  hunsa.txt /n";
}
   
