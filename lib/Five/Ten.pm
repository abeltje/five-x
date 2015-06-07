package Five::Ten;
use 5.010;
use warnings;
use strict;
use feature ':5.10';

sub import {
    warnings->import();
    strict->import();
    feature->import(':5.10');
}

1;

=head1 NAME

Five::Ten - Enable 'strict', 'warnings' and 'features :5.10' in the calling code

=head1 COPYRIGHT

(c) MMXV - Abe Timmerman <abeltje@cpan.org>

=cut
