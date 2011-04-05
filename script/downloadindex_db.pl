#!/usr/bin/perl
use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";
use DownLoadIndex_db;
my $url ='http://www.nasdaq.com/';
my $dlp = DownLoadIndex_db->new(url => $url);
$dlp->content;
$dlp->insert_to_database;




