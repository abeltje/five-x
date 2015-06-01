package Five::Eighteen;
use 5.018;
use warnings;
use strict;
use feature ':5.18';

sub import {
    my $class = shift;

    my @features;
    if (@_ and $_[0] eq 'experimental') {
        push @features, 'lexical_subs';
    };

    warnings->import();
    strict->import();
    if (@features) {
        my @no_warnings = map "experimental::$_", @features;
        warnings->unimport(@no_warnings);
    }
    feature->import(':5.18', @features);
}

1;
