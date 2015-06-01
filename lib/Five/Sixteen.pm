package Five::Sixteen;
use 5.016;
use warnings;
use strict;
use feature ':5.16';

sub import {
    my $class = shift;
    warnings->import();
    strict->import();
    feature->import(':5.16');
}

1;
