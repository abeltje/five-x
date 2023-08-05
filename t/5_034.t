#! perl -w
use Test::More;
BEGIN { $] < 5.034 and plan skip_all => "Not perl 5.34 yet: $]"; }
use if $ENV{AUTHOR_TESTING}, 'Test::Warnings';

BEGIN { $Five::Thirtyfour::DEBUG = $ENV{TEST_DEBUG}; }

use Five::Thirtyfour ':experimental';

# No actual new features in 5.34
# unfeatures: bareword_filehandles, multidimentional
{
    note("no feature 'bareword_filehandles'");
    my $prog = q{open(INF, "<", $0) or die "Cannot open($0): $!"};
    my $ok = eval $prog;
    my $error = $@;
    like(
        $error,
        qr/^Bareword filehandle "INF" not allowed under 'no feature "bareword_filehandles"'/,
        "No more bareword filehandles"
    ) or diag("Compile-error: ", $error);
}

{
    note("use feature 'bareword_filehandles'");
    use feature 'bareword_filehandles';
    my $prog = q{
open(INF, "<", $0) or die "Cannot open($0): $!";
close(INF);
    };
    my $ok = eval $prog;
    my $error = $@;
    is($error, "", "Needs feature for bareword filehandles")
        or diag("Compile-error: ", $error);
}

{
    note("no feature 'multidimentional'");
    my $prog = q< my %x; $x{1, 'b'} = 42; $x{1, 'b'}>;
    my $ok = eval $prog;
    my $error = $@;
    like(
        $error,
        qr/^Multidimensional hash lookup is disabled/,
        "No more support for multidimentional hashes"
    ) or diag($ok => $error);
}

{
    note("use feature 'multidimentional'");
    use feature 'multidimensional';
    my $prog = q< my %x; $x{1, 'b'} = 42; $x{1, 'b'}>;
    my $ok = eval $prog;
    my $error = $@;
    is($error, "", "multidimentional compiles");
    is($ok, 42, "mulitidimentional works");
}

done_testing();
