#! perl

use Test::More;

BEGIN {
    if ( $] < 5.008 ) {
        plan(skip_all => "This is not 5.008");
    }
    else {
        plan(tests => 4);
    }
    use_ok("Five::Eight");
    Five::Eight->import();
}

{ # Enable strict and warnings;
    eval '$x = 10;';
    like(
        $@,
        qr/^Global symbol "\$x" requires explicit package name at/,
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
