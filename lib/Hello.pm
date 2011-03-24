package Hello;
use strict;

&hei(@ARGV[0]);
sub hei{
     my ($name) = @ARGV[0]; 
     return print("Hello $name\n");
}
1;
