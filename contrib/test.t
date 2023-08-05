#! /usr/bin/env perl
use warnings;
use strict;
use Test::More;
use Cwd qw< abs_path >;

my $old = fetch_features(abs_path('lib/Five/Features.pl'));
my $new = fetch_features(abs_path('contrib/Features.pl'));

is_deeply($new, $old, "Same features") or diag(explain($new));
diag("@{[ sort keys %$new ]}");

done_testing();

sub fetch_features {
    my ($file) = @_;

    note("Reading from $file");
    local $ENV{PERL_USE_UNSAFE_INC} = 1;
    our $Features; do $file;

    return { %$Features };
}
