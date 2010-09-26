package Five::Twelve::Zero;
use 5.012000;
use warnings;
use strict;
use feature ':5.12.0';

sub import {
    warnings->import();
    strict->import();
    feature->import(':5.12.0');
}

1;
