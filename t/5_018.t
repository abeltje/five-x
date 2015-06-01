#! perl -w
use Test::More;
BEGIN { $] < 5.018 and plan skip_all => "Not perl 5.18 yet: $]"; }

use Five::Eighteen 'experimental';

use Test::NoWarnings ();

{
    eval q/
{
    my sub l { return 42 };
    is(l(), 42, "Test local sub");
}
my $l = l();
    /;
    is($@, <<"    EOE", "unknown sub &main::l");
Undefined subroutine &main::l called at (eval 7) line 6.
    EOE
}

Test::NoWarnings::had_no_warnings();
$Test::NoWarnings::do_end_test = 0;
done_testing();
