#!/user/bin/env perl
use strict;

my $num = 1;

my $max = @ARGV[0];

for($num=1;$num<=$max;$num++){


if(($num%3==0)&&($num%5==0)){
	
		print "fizzbuzz\n";

	}elsif($num%3==0){

		print "fizz\n";

	}elsif($num%5==0){

		print "buzz\n";
	}else {
		print "$num\n";
	}


}

