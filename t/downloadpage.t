use strict;
use warnings;
use Test::More;
use ok 'DownLoadPage';
my $obj = DownLoadPage->new(url => 'http://www.sit.kmutt.ac.th');
my $filename = 'SIT.txt';
my $var ;
ok( defined $obj );  
isa_ok($obj, 'DownLoadPage');
is(DownLoadPage::write_to_file($obj,$filename),'1','Test Write To File:OK');
#is($obj->content,'1','Test content');
#like($obj->content, qr/Something that appears on the page/, 'Test content');
#$var =~ /regular expression/
like($obj->content, qr/SIT/, 'Test content');
ok($obj->content =~ /SIT/, 'content contains SIT');

done_testing();
