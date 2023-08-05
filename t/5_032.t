#! perl -w
use Test::More;
BEGIN { $] < 5.032 and plan skip_all => "Not perl 5.32 yet: $]"; }
use if $ENV{AUTHOR_TESTING}, 'Test::Warnings';

BEGIN { $Five::Thirtytwo::DEBUG = $ENV{TEST_DEBUG}; }
use Five::Thirtytwo ':experimental';
{
    my $x = bless({}, 'This::Class');
    my $ok = eval q{$x isa 'This::Class'};
    is($@, "", "isa-operator compiles") or diag($@);
    ok($ok, "isa operator");
}

{
    my $x = bless({}, 'This::Class');
    sub This::Class::method_call2 { return 42 }
    my $ok = eval q{ no warnings; method_call2 $x };
    my $error = $@;
    like(
        $error,
        qr/syntax error at \(eval \d+\) line \d+, near "method_call2 \$x/,
        "indirect syntax doesn't compile"
    ) or diag($error);
}

{
    use feature 'indirect';
    my $x = bless({}, 'This::Class');
    sub This::Class::method_call { return 42 }
    my $ok = eval q{ method_call $x };
    is($@, "", "indirect syntax still compiles") or diag($@);
    is($ok, 42, "indirect syntax still works") or diag($ok);
}

done_testing();
