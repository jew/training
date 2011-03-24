package Hello;
use strict;

print &hei(@ARGV[0]);


sub hei{


     my ($name) = @ARGV[0];
     
     return "Hello $name\n";

}


1;
