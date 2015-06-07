#! perl
use Test::More;
BEGIN { $] < 5.008 and plan skip_all => "Not perl 5.8 yet: $]"; }

use Five::Eight;

use Test::NoWarnings ();

{ # Enable strict and warnings;
    eval '$x = 10;';
    like(
        $@,
        qr/^Global symbol "\$x" requires explicit package name /,
        "strict is enabled"
    );

    my $warning;
    local $SIG{__WARN__} = sub { $warning = shift };
    eval 'my $y =~ s/x/y/;';
    like(
        $warning,
        qr/^Use of uninitialized value/,
        "warnings is enabled"
    );

    # This is 5.080; no say();
    eval 'say("This is 5.008");';
    like(
        $@,
        qr/Undefined subroutine &main::say called/,
        "No 5.010 features"
    );
}

Test::NoWarnings::had_no_warnings();
$Test::NoWarnings::do_end_test = 0;
done_testing();
