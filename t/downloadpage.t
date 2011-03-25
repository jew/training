use strict;
use warnings;
use Test::More;
use ok 'DownLoadPage';
my $obj = DownLoadPage->new();
isa_ok($obj, 'DownLoadPage');
done_testing();
