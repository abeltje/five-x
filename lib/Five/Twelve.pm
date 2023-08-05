package Five::Twelve;
use warnings;
use strict;
use v5.12;

use parent 'Five::X';

our $DEBUG //= 0;

sub import {
    my $class = shift;

    $class->SUPER::import("5.012", @_);
}

1;

=head1 NAME

Five::Twelve - Enable 'strict', 'warnings' and 'features :5.12' in the calling code

=head1 SYNOPSIS

    package MyPackage;
    use Five::Twelve;
    # strict, warnings and featere :5.12

Perl 5.18 introduced warnings in the B<experimental::> class that reflect on
features from previous versions. Use the B<:experimental> import-tag to disable
these warnings.

    package MyPackage;
    use Five::Twelve ':experimental';
    # use given/when/smartmatch on perl-5.18+ without warnings

=head1 COPYRIGHT

(c) MMXV - Abe Timmerman <abeltje@cpan.org>

=cut
