package Hello;
use strict;
sub hei {
    my ($name) = @_; 
    if($name eq "Bjorn"){
        return ("Hei $name");
	}else{
        return ("Hello $name");
	}
}

1;
=head2 hei
hei() is subroutine that get name from command line and return Hello and name that get from command line 
=cut
