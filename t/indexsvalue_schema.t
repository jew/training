#!/usr/bin/perl
use Test::More;
use DBI;
use Indexsvalue::Schema;

use ok 'Indexsvalue::Schema';
use ok 'DownLoadIndex_db';
my $db = Indexsvalue::Schema->connect('t/run/testdb.sqlite');
isa_ok($db, 'Indexsvalue::Schema');
my $url ='http://www.nasdaq.com/';
my $dl = DownLoadIndex_db->new(url => $url);
is(DownLoadIndex_db::insert_to_database($dl),'1',' update:OK');

done_testing();
