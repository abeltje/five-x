#! perl -w
use v5.10;
use strict;

use Test::More;
use Test::Pod::Coverage;
my %map = (
    'Five::Eight'     => 5.008,
    'Five::Ten'       => 5.010,
    'Five::Twelve'    => 5.012,
    'Five::Fourteen'  => 5.014,
    'Five::Sixteen'   => 5.016,
    'Five::Eighteen'  => 5.018,
    'Five::Twenty'    => 5.020,
    'Five::TwentyTwo' => 5.022,
);
note("Pod::Coverage: ", explain([all_modules]));

for my $module (all_modules()) {
    SKIP: {
        skip("$module: $map{$module} > $]", 1)
            if exists $map{$module} and $] <= $map{$module};
        pod_coverage_ok($module);
    }
}

done_testing();
