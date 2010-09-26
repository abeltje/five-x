#! perl

use Test::More;

BEGIN {
    if ( $] < 5.010 ) {
        plan(skip_all => "This is not perl 5.10 ($])");
    }
    else {
        plan(tests => 5);
        use_ok("Five::Ten");
        Five::Ten->import();
    }
}

{ # Enable strict and warnings and features;
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

    my $stdout;
    {
        local *STDOUT;
        open STDOUT, '>>', \$stdout;
        eval 'say("This is 5.010");';
        is($@, '', "5.010 features");
    }
    is($stdout, "This is 5.010\n", "say()");
}
