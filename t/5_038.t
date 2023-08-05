#! perl
use Test::More;
BEGIN { $] < 5.038 and plan skip_all => "Not perl 5.38 yet: $]"; }
use if $ENV{AUTHOR_TESTING}, 'Test::Warnings';

BEGIN { $Five::Thirtyeight::DEBUG = $ENV{TEST_DEBUG}; }
use Five::Thirtyeight ':experimental';

{
    note("feature 'class'");
    my $prog = <<'EOP1';
class MyClass 0.01 {
    field $x :param //= 42;
    method x :prototype(;$) {
        if (@_) { $x = shift }
        return $x;
    }
}
    my $x = MyClass->new(x => 10);
    is($x->x, 10, "Initial value is " . $x->x);

    my $y = MyClass->new();
    is($y->x, 42, "Default value is " . $y->x);

    $y->VERSION;
EOP1

    my $ok = eval $prog;
    my $error = $@;
    is($error, "", "class syntax compiles");
    is($ok, '0.01', "class version also set");
}

done_testing();
