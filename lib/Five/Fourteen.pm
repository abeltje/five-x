package Five::Fourteen;
use 5.014;
use warnings;
use strict;
use feature ':5.14';

sub import {
    warnings->import();
    strict->import();
    feature->import(':5.14');
}

1;
