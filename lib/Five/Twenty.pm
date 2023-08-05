package Five::Twenty;
use warnings;
use strict;
use v5.20;

use parent 'Five::X';

our $DEBUG //= 0;

sub import {
    my $class = shift;

    $class->SUPER::import("5.020", @_);
}

1;

=head1 NAME

Five::Twenty - Enable 'strict', 'warnings' and 'features :5.20' in the calling code

=head1 SYNOPSIS

    package MyPackage;
    use Five::Twenty;
    # strict, warnings and featere :5.20

Perl 5.18 introduced experimental features that warn. These warnings can be
switched off with special 'no warnings' catagories. Use the B<:experimental>
import-tag to enable these features without warnings.

    package MyPackage;
    use Five::Eighteen ':experimental';
    # now you also have 'lexical subs', 'postderef', 'postderef_qq', 'signatures'
    # also use given/when/smartmatch on perl-5.18+ without warnings

=head1 COPYRIGHT

(c) MMXV - Abe Timmerman <abeltje@cpan.org>

=cut
