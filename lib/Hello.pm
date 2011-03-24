package Hello;
use strict;

&hei(@_);
sub hei{
     my ($name) = @_; 
     return "Hello $name\n";
}
1;
