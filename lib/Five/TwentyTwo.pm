package Five::TwentyTwo;
use 5.022;
use warnings;
use strict;
use feature ':5.22';

use Five::X;

sub import {
    my $class = shift;

    my @features;
    if (@_ and $_[0] eq ':experimental') {
        push @features, qw(
            lexical_subs postderef postderef_qq signatures
            bitwise refaliasing
        );
    };

    warnings->import();
    strict->import();
    if (@features) {
        my @no_warnings = map "experimental::$_", grep !/_qq/, @features;
        warnings->unimport(@no_warnings);

        for my $version (experimental_versions()) {
            next if $] < $version;
            warnings->unimport(@{ experimental_warnings($version) });
        }
    }
    feature->import(':5.22', @features);
}

1;

=head1 NAME

Five::TwentyTwo - Enable 'strict', 'warnings' and 'features :5.22' in the calling code

=head1 SYNOPSIS

    package MyPackage;
    use Five::Eighteen;
    # strict, warnings and featere :5.22

Perl 5.18 introduces experimental features that warn. These warnings can be
switched off with special 'no warnings' catagories. Use the B<:experimental>
import-tag to enable these features without warnings.

    package MyPackage;
    use Five::TwentyTwo ':experimantal';
    # now you also have:
    # 'lexical subs', 'postderef', 'postderef_qq', 'signatures', 'bitwise',
    # 'refaliasing'

=head1 COPYRIGHT

(c) MMXV - Abe Timmerman <abeltje@cpan.org>

=cut
