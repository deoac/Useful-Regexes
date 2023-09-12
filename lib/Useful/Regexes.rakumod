#! /usr/bin/env raku

# A collection of useful Raku regexes.
# © 2023 Shimon Bollinger. All rights reserved.
# Last modified: Tue 12 Sep 2023 03:15:43 PM EDT
# Version 0.0.1

# begin-no-weave
# always use the latest version of Raku
use v6.*;
use PrettyDump;
use Data::Dump::Tree;
#end-no-weave

unit role Useful::Regexes;

my token hws            {    <!ww>\h*       } # Horizontal White Space
my token leading-ws     { ^^ <hws>          } # Whitespace at start of line
my regex optional-chars {    \N*?           }
my token rest-of-line   {    \N*   [\n | $] }
my token ws-till-EOL    {    <hws> [\n | $] }
my token blank-line     { ^^ <ws-till-EOL>  }
my token opening-quote  { <:Ps +      # Unicode Open_Punctuation
                           :Pi +      # Unicode Initial_Punctuation
                           [\' " \\]
                          >
                        } # end of my token opening-quote

my token closing-quote  { <:Pe +      # Unicode Close_Punctuation
                           :Pf +      # Unicode Final_Punctuation
                           [\' " \\]
                          >
                        } # end of my token closing-quote

##############################################################################
##    Example 7.1 (Recommended) from Chapter 7 of "Perl Best Practices"     ##
##     Copyright (c) O'Reilly & Associates, 2005. All Rights Reserved.      ##
##############################################################################

=begin pod

=head1 NAME

Useful::Regexes - A collection of useful Raku regexes.


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

<Shimon Bollinger>  (<deoac.bollinger@gmail.com>)


=head1 LICENCE AND COPYRIGHT

Copyright (c)2022 Shimon Bollinger. All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Raku itself. See L<The Artistic License 2.0|https://opensource.org/licenses/Artistic-2.0>.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

=end pod



