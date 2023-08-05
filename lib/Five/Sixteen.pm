package Five::Sixteen;
use warnings;
use strict;
use v5.16;

use parent 'Five::X';

our $DEBUG //= 0;

sub import {
    my $class = shift;

    $class->SUPER::import("5.016", @_);
}

1;

=head1 NAME

Five::Sixteen - Enable 'strict', 'warnings' and 'features :5.16' in the calling code

=head1 SYNOPSIS

    package MyPackage;
    use Five::Sixteen;
    # strict, warnings and featere :5.16

Perl 5.18 introduced warnings in the B<experimental::> class that reflect on
features from previous versions. Use the B<:experimental> import-tag to disable
these warnings.

    package MyPackage;
    use Five::Sixteen ':experimental';
    # use given/when/smartmatch on perl-5.18+ without warnings

=head1 COPYRIGHT

(c) MMXV - Abe Timmerman <abeltje@cpan.org>

=cut
