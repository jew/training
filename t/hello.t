use strict;
use warnings;
use Test::More;

use ok 'Hello';

is(Hello::hei('Jew'), 'Hello Jew', 'Jew ok');
is(Hello::hei('Toon'), 'Hello Toon', 'Toon ok');
is(Hello::hei('Bjorn'), 'Hei Bjorn', 'Bjorn ok');


done_testing();

