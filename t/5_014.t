#! perl
use Test::More;
BEGIN { $] < 5.014 and plan skip_all => "Not perl 5.14 yet: $]"; }

use Five::Fourteen;

use Test::NoWarnings ();

{
    my $upper = 'É';
    like($upper, qr/\w/, "feature 'unicode_strings'");
}

Test::NoWarnings::had_no_warnings();
$Test::NoWarnings::do_end_test = 0;
done_testing();
