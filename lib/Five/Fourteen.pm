package Five::Fourteen;
use 5.014;
use warnings;
use strict;
use feature ':5.14';

sub import {
    warnings->import();
    strict->import();
    feature->import(':5.14');
}

1;

=head1 NAME

Five::Fourteen - Enable 'strict', 'warnings' and 'features :5.14' in the calling code

=head1 COPYRIGHT

(c) MMXV - Abe Timmerman <abeltje@cpan.org>

=cut
