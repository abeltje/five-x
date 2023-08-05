#! perl -w
use Test::More;
BEGIN { $] < 5.022 and plan skip_all => "Not perl 5.22 yet: $]"; }
use if $ENV{AUTHOR_TESTING}, 'Test::Warnings';

BEGIN { $Five::Twentytwo::DEBUG = $ENV{TEST_DEBUG}; }
use Five::Twentytwo ':experimental';

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

{
    note("feature signatures (experimental)");
    my $prog = <<'EOP';
sub t1($x = 42) { return $x }
sub t2($x) { return $x }

is(t1(), 42, "Optional parameter");
is(t1(100), 100, "Parameter with value");
is(t2(42), 42, "Required parameter");
my $nok = eval { t2() };
my $error = $@;
like(
    $error,
    qr/^\QToo few arguments for subroutine 'main::t2' (got 0; expected 1)\E/,
    "The compiler catches signature errors"
);
EOP

    my $ok = eval $prog;
    my $error = $@;
    is($error, "", "Signature syntax compiles");

}

done_testing();
