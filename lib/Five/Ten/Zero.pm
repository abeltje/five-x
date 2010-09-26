package Five::Ten::Zero;
use 5.010000;
use warnings;
use strict;
use feature ':5.10';

sub import {
    warnings->import();
    strict->import();
    feature->import(':5.10.0');
}

1;
