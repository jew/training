package FizzBuzz;
use strict;
sub fizzbuzz {
    my ($num) = @_;
    if(($num%3==0)&&($num%5==0)) {
        return "fizzbuzz";
    }
    elsif($num%3==0) {
        return "fizz";
    } 
    elsif($num%5==0) {
        return  "buzz";
    }
    else {
     return  "$num";
   }
}
2;
=head2 fizzbuzz
    fizzbuzz() is a subroutine that get number  from command line and compare number with condition and return value
=cut
