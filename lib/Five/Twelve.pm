package Five::Twelve;
use 5.012;
use warnings;
use strict;
use feature ':5.12';

sub import {
    warnings->import();
    strict->import();
    feature->import(':5.12');
}

1;
