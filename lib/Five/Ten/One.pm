package Five::Ten::One;
use 5.010001;
use warnings;
use strict;
use feature ':5.10';

sub import {
    warnings->import();
    strict->import();
    feature->import(':5.10.1');
}

1;
