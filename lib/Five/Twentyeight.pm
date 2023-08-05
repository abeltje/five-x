package Five::Twentyeight;
use warnings;
use strict;
use v5.28;

use parent 'Five::X';

our $DEBUG //= 0;

sub import {
    my $class = shift;

    $class->SUPER::import("5.028", @_);
}

1;

=head1 NAME

Five::Twentyeight - Enable 'strict', 'warnings' and 'features :5.28' in the calling code

=head1 SYNOPSIS

    use Five::Twentyeight ':experimental';

=head1 DESCRIPTION

=head2 experimental warnings

=over

=item B<experimental::alpha_assertions>

=item B<experimental::script_run>

=back

=head2 features no longer experimental

=over

=item B<bitwise>

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
