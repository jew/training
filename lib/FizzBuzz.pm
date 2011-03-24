package FizzBuzz;
use strict;
sub  fizzbuzz {
    my $num = 1;
    my $max = @ARGV[0];
    if(($num%3==0)&&($num%5==0)){
        return("fizzbuzz\n");
    } 
	elsif($num%3==0) {
		return("fizz\n");
    } 
	elsif($num%5==0) {
        return("buzz\n");
	}
	else {
		return("$num\n");
	}
}
