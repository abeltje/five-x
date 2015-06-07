#! perl
use Test::More;
BEGIN { $] < 5.016 and plan skip_all => "Not perl 5.16 yet: $]"; }

use Five::Sixteen;

use Test::NoWarnings ();

{
    sub mysub {
        if (!@_) { return __SUB__ }
        return shift;
    }

    my $ref = mysub();
    is($ref->(42), 42, '__SUB__ token supported');
}

Test::NoWarnings::had_no_warnings();
$Test::NoWarnings::do_end_test = 0;
done_testing();
