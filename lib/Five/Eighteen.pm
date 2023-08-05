package Five::Eighteen;
use warnings;
use strict;
use v5.18;

use parent 'Five::X';

our $DEBUG //= 0;

sub import {
    my $class = shift;

    $class->SUPER::import("5.018", @_);
}

1;

=head1 NAME

Five::Eightteen - Enable 'strict', 'warnings' and 'features :5.18' in the calling code

=head1 SYNOPSIS

    package MyPackage;
    use Five::Eighteen;
    # strict, warnings and featere :5.18

Perl 5.18 introduces experimental features that warn. These warnings can be
switched off with special 'no warnings' catagories. Use the B<:experimental>
import-tag to enable these features without warnings.

    package MyPackage;
    use Five::Eighteen ':experimental';
    # now you also have 'lexical subs'
    # also use given/when/smartmatch on perl-5.18+ without warnings

=head1 COPYRIGHT

(c) MMXV - Abe Timmerman <abeltje@cpan.org>

=cut
