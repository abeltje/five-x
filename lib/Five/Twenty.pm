package Five::Twenty;
use 5.020;
use warnings;
use strict;
use feature ':5.20';

sub import {
    my $class = shift;

    my @features;
    if (@_ and $_[0] eq ':experimental') {
        push @features, ('lexical_subs', 'postderef', 'postderef_qq', 'signatures');
    };

    warnings->import();
    strict->import();
    if (@features) {
        my @no_warnings = map "experimental::$_", grep !/_qq/, @features;
        warnings->unimport(@no_warnings);
    }
    feature->import(':5.20', @features);
}

1;

=head1 NAME

Five::Twenty - Enable 'strict', 'warnings' and 'features :5.20' in the calling code

=head1 SYNOPSIS

    package MyPackage;
    use Five::Eighteen;
    # strict, warnings and featere :5.20

Perl 5.18 introduces experimental features that warn. These warnings can be
switched off with special 'no warnings' catagories. Use the B<:experimental>
import-tag to enable these features without warnings.

    package MyPackage;
    use Five::Eighteen ':experimantal';
    # now you also have 'lexical subs', 'postderef', 'postderef_qq', 'signatures'

=head1 COPYRIGHT

(c) MMXV - Abe Timmerman <abeltje@cpan.org>

=cut
