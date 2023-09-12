# Useful::Regexes - A collection of useful Raku regexes.
>
## Table of Contents
[All the regexes](#all-the-regexes)  
[VERSION](#version)  
[SYNOPSIS](#synopsis)  
[BUGS AND LIMITATIONS](#bugs-and-limitations)  
[AUTHOR](#author)  
[LICENCE AND COPYRIGHT](#licence-and-copyright)  

----
# All the regexes




```
    3| unit role Useful::Regexes;
    4| 
    5| my token hws            is export(:MANDATORY) {    <!ww>\h*       }
    6| my token leading-ws     is export(:MANDATORY) { ^^ <hws>          }
    7| my regex optional-chars is export(:MANDATORY) {    \N*?           }
    8| my token rest-of-line   is export(:MANDATORY) {    \N*   [\n | $] }
    9| my token ws-till-EOL    is export(:MANDATORY) {    <hws> [\n | $] }
   10| my token blank-line     is export(:MANDATORY) { ^^ <ws-till-EOL>  }
   11| 
   12| my token opening-quote  is export(:MANDATORY) { <:Open_Punctuation    +
   13|                                                  :Initial_Punctuation +
   14|                                                  [\' \" \\]
   15|                                                 >
   16| }
   17| 
   18| my token closing-quote  is export(:MANDATORY) { <:Close_Punctuation +
   19|                                                  :Final_Punctuation +
   20|                                                  [\' \"]
   21|                                                 >
   22| }
   23| 

```




# VERSION
This documentation refers to Useful::Regexes version 0.0.1

# SYNOPSIS
```
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
```
# BUGS AND LIMITATIONS
There are no known bugs in this module. Please report problems to the Author. Patches are welcome.

# AUTHOR
Shimon Bollinger (<deoac.bollinger@gmail.com>)

# LICENCE AND COPYRIGHT
Copyright (c)2022 Shimon Bollinger. All rights reserved.

This module is free software; you can redistribute it and/or modify it under the same terms as Raku itself. See [The Artistic License 2.0](https://opensource.org/licenses/Artistic-2.0).

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.







----
Rendered from  at 2023-09-12T20:21:02Z
