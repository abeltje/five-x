package Five::Twelve::One;
use 5.012001;
use warnings;
use strict;
use feature ':5.12.1';

sub import {
    warnings->import();
    strict->import();
    feature->import(':5.12.1');
}

1;
