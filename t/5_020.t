#! perl -w
use Test::More;
BEGIN { $] < 5.020 and plan skip_all => "Not perl 5.20 yet: $]"; }

use Five::Twenty ':experimental';

use Test::NoWarnings ();

{
    my sub add ($x, $y) {
        return $x + $y;
    };

    is(add(40,2), 42, "named prototypes");
}

Test::NoWarnings::had_no_warnings();
$Test::NoWarnings::do_end_test = 0;
done_testing();
