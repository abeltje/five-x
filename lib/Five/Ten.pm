package Five::Ten;
use 5.010;
use warnings;
use strict;
use feature ':5.10';

sub import {
    warnings->import();
    strict->import();
    feature->import(':5.10');
}

1;
