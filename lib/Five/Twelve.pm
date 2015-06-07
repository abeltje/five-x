package Five::Twelve;
use 5.012;
use warnings;
use strict;
use feature ':5.12';

sub import {
    warnings->import();
    strict->import();
    feature->import(':5.12');
}

1;

=head1 NAME

Five::Twelve - Enable 'strict', 'warnings' and 'features :5.12' in the calling code

=head1 COPYRIGHT

(c) MMXV - Abe Timmerman <abeltje@cpan.org>

=cut
