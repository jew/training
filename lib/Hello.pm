package Hello;
use strict;
&hei(@_);
sub hei {
     my ($name) = @_; 
     return "Hello $name\n";
}
1;
=head2 <hei>
hei() is subroutine that get name from command line and return Hello and name that get from command line 
=cut
