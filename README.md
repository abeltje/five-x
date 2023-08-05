# NAME

Five::X - A set of modules that enable strict and warnings and features

# SYNOPSIS

```perl
#! /usr/bin/perl
use Five::Ten; # use feature ':5.10'; use strict; use warnings;
say "Turned on features for 5.10";
```

# DESCRIPTION

Either of these modules turns on strict, warnings and features in the calling package.

I have tried to document all the new features/experimentals per version. To
understand what a feature or experimental is, one should read the _perldelta_
document for that version.

## Experimental

Starting with perl version 5.18, some features are experimental and will warn in
the catagory `experimental::<feature>`. These will not be switched on by
default, you'll have to add the ':experimental' tag to enable these features and
disable the warnings that come with them.

## experimental\_versions

Returns an ordered list of versions that have warings in the `experimental::`
class without a feature category.

## experimental\_warnings($version)

Returns a listref of the warnings in the `experimental::` class for the given
perl version.

## features($version)

This returns a ref to a list of feature-names that are available in `$version`
that are not marked as experimental.

Keep in mind features can be removed (like **autoderef**) and will not show if
the actual version of perl doesn't have them anymore.

## all\_features

This returns a ref to a list of feature-names that ar available in `$version`,
including the features marked as experimental.

## unfeatures($version)

Newer versions of perl have features that one would like to turn off as the
syntax they represent is discouraged. All the `Five::X` do this by default. If
one wants indirect object syntax under [Five::ThirtyTwo](https://metacpan.org/pod/Five%3A%3AThirtyTwo) or higher one must
explicitly turn it on:

```perl
use feature 'indirect';
```

# SEE ALSO

[Five::Ten](https://metacpan.org/pod/Five%3A%3ATen) [Five::Twelve](https://metacpan.org/pod/Five%3A%3ATwelve) [Five::Fourteen](https://metacpan.org/pod/Five%3A%3AFourteen) [Five::Sixteen](https://metacpan.org/pod/Five%3A%3ASixteen) [Five::Eigtteen](https://metacpan.org/pod/Five%3A%3AEigtteen)

[Five::Twenty](https://metacpan.org/pod/Five%3A%3ATwenty) [Five::Twentytwo](https://metacpan.org/pod/Five%3A%3ATwentytwo) [Five::Twentyfour](https://metacpan.org/pod/Five%3A%3ATwentyfour) [Five::Twentysix](https://metacpan.org/pod/Five%3A%3ATwentysix) [Five::Twentyeight](https://metacpan.org/pod/Five%3A%3ATwentyeight)

[Five::Thirty](https://metacpan.org/pod/Five%3A%3AThirty) [Five::Thirtytwo](https://metacpan.org/pod/Five%3A%3AThirtytwo) [Five::Thirtyfour](https://metacpan.org/pod/Five%3A%3AThirtyfour) [Five::Thirtysix](https://metacpan.org/pod/Five%3A%3AThirtysix) [Five::Thirtyeight](https://metacpan.org/pod/Five%3A%3AThirtyeight)

# COPYRIGHT

© MMXXIII - Abe Timmerman <abeltje@cpan.org>

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
