#! perl
use Test::More;
BEGIN { $] < 5.010 and plan skip_all => "Not perl 5.10 yet: $]"; }

use Five::Ten;

{ # Enable strict and warnings and features;
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

    my $stdout;
    {
        local *STDOUT;
        open STDOUT, '>>', \$stdout;
        eval 'say("This is 5.010");';
        is($@, '', "5.010 features");
    }
    is($stdout, "This is 5.010\n", "say()");
}

done_testing();
