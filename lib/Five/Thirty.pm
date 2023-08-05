package Five::Thirty;
use warnings;
use strict;
use v5.30;

use parent 'Five::X';

our $DEBUG //= 0;

sub import {
    my $class = shift;

    $class->SUPER::import("5.030", @_);
}

1;

=head1 NAME

Five::Thirty - Enable 'strict', 'warnings' and 'features :5.30' in the calling code

=head1 SYNOPSIS

    use Five::Thirty ':experimental';

=head1 DESCRIPTION

=head2 feautures

No actual features in 5.30.

=head2 features removed

These features have been removed:

=over

=item B<array_base>

assining to C<$[> is now fatal.

=back

=head1 COPYRIGHT

E<copy> MMXV - Abe Timmerman <abeltje@cpan.org>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

=cut
