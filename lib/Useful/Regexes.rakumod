#! /usr/bin/env raku

# A collection of useful Raku regexes.
# © 2023 Shimon Bollinger. All rights reserved.
# Last modified: Tue 12 Sep 2023 04:20:15 PM EDT
# Version 0.0.1

# begin-no-weave
# always use the latest version of Raku
use v6.*;
use PrettyDump;
use Data::Dump::Tree;
#end-no-weave

=begin pod
=TITLE Useful::Regexes - A collection of useful Raku regexes.


=head1 All the regexes

=end pod

unit role Useful::Regexes;

my token hws            is export(:MANDATORY) {    <!ww>\h*       } #| Horizontal White Space
my token leading-ws     is export(:MANDATORY) { ^^ <hws>          } # Whitespace at start of line
my regex optional-chars is export(:MANDATORY) {    \N*?           }
my token rest-of-line   is export(:MANDATORY) {    \N*   [\n | $] }
my token ws-till-EOL    is export(:MANDATORY) {    <hws> [\n | $] }
my token blank-line     is export(:MANDATORY) { ^^ <ws-till-EOL>  }

# The backslash is included as an opening-quote because it's useful for
# detecting a comment symbol (#) when it's not being used as a comment.
my token opening-quote  is export(:MANDATORY) { <:Open_Punctuation    +
                                                 :Initial_Punctuation +
                                                 [\' \" \\]
                                                >
} # end of my token opening-quote

my token closing-quote  is export(:MANDATORY) { <:Close_Punctuation +
                                                 :Final_Punctuation +
                                                 [\' \"]
                                                >
} # end of my token closing-quote

##############################################################################
##    Example 7.1 (Recommended) from Chapter 7 of "Perl Best Practices"     ##
##     Copyright (c) O'Reilly & Associates, 2005. All Rights Reserved.      ##
##############################################################################

=begin pod

=head1 VERSION

This documentation refers to Useful::Regexes version 0.0.1


=head1 SYNOPSIS

    use Useful::Regexes;

    my $test-string = 'This “#” is not a comment!  # <-- this is';

    say $test-string ~~
        /<leading-ws> <opening-quote> '#' <closing-quote> <rest-of-line>/;

        # Output:
        ｢  This ｢#｣ is not a comment!  # <-- this is｣
         leading-ws => ｢｣
           hws => ｢｣
         optional-chars => ｢This ｣
         opening-quote => ｢“｣
         closing-quote => ｢”｣
         rest-of-line => ｢ is not a comment!  # <-- this is｣

    my class Foo does Useful::Regexes {
        {...}
    }

=head1 BUGS AND LIMITATIONS

There are no known bugs in this module.
Please report problems to the Author.
Patches are welcome.

=head1 AUTHOR

Shimon Bollinger  (<deoac.bollinger@gmail.com>)


=head1 LICENCE AND COPYRIGHT

Copyright (c)2022 Shimon Bollinger. All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Raku itself. See L<The Artistic License 2.0|https://opensource.org/licenses/Artistic-2.0>.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

=end pod



