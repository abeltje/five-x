#! perl
use Test::More;
BEGIN { $] < 5.014 and plan skip_all => "Not perl 5.14 yet: $]"; }

use Five::Fourteen;
{
    my $upper = 'É';
    like($upper, qr/\w/, "feature 'unicode_strings'");
}

done_testing();
