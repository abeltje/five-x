#! perl -w
use Test::More;
BEGIN { $] < 5.022 and plan skip_all => "Not perl 5.22 yet: $]"; }

use Five::TwentyTwo ':experimental';

use Test::NoWarnings ();

{
    # refaliasing
    my @array = ({a => 1});
    for \my %hash (@array) {
        is(\%hash, $array[0], "same ref");
        is_deeply(\%hash, $array[0], "refaliasing");
        $hash{a} = 42;
        is_deeply(\%hash, $array[0], "refaliasing, array changes with alias");
    }
}

Test::NoWarnings::had_no_warnings();
$Test::NoWarnings::do_end_test = 0;
done_testing();

