package Five::Twentytwo;
use warnings;
use strict;
use v5.22;

use parent 'Five::X';

our $DEBUG //= 0;

sub import {
    my $class = shift;

    $class->SUPER::import("5.022", @_);
}

1;

=head1 NAME

Five::Twentytwo - Enable 'strict', 'warnings' and 'features :5.22' in the calling code

=head1 SYNOPSIS

    package MyPackage;
    use Five::TwentyTwo;
    # strict, warnings and featere :5.22

Perl 5.18 introduced experimental features that warn. These warnings can be
switched off with special 'no warnings' catagories. Use the B<:experimental>
import-tag to enable these features without warnings.

    package MyPackage;
    use Five::TwentyTwo ':experimental';
    # now you also have:
    # 'lexical subs', 'postderef', 'postderef_qq', 'signatures', 'bitwise',
    # 'refaliasing'
    # also use given/when/smartmatch on perl-5.18+ without warnings

=head1 COPYRIGHT

(c) MMXV - Abe Timmerman <abeltje@cpan.org>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

=cut
