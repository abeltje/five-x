# perl
use Test::More;
BEGIN { $] < 5.030 and plan skip_all => "Not perl 5.30 yet: $]"; }
use if $ENV{AUTHOR_TESTING}, 'Test::Warnings';

BEGIN { $Five::Thirty::DEBUG = $ENV{TEST_DEBUG}; }
use Five::Thirty ':experimental';

{
    my $prog = <<~ 'EOP';
        $[ = 1; my @a = (42); $a[1];
        EOP
    my $nok = eval $prog;
    my $error = $@;
    like(
        $error,
        qr/^Assigning non-zero to \$\[ is no longer possible/,
        "no assignment to \$["
    );
}

done_testing();
