use strict;
use warnings;
use Test::More;
use ok 'DownLoadPage';
my $obj = DownLoadPage->new(url => 'testurl');
isa_ok($obj, 'DownLoadPage');
done_testing();
