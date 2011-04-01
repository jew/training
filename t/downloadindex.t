use strict;
use warnings;
use Test::More;
use ok 'DownLoadIndex';
my $url ='http://www.nasdaq.com/';
my $obj = DownLoadIndex->new(url => $url);
my $filename = 'result.txt';

my $var ;
ok( defined $obj );  
isa_ok($obj, 'DownLoadIndex');
is(DownLoadIndex::write_to_file($obj,$filename),'1','Test Write To File:OK');
like($obj->content->[1]->{name}, qr/DJIA/, 'Test content');
is(DownLoadIndex::update_index($obj),'1','Update:OK');
done_testing();


