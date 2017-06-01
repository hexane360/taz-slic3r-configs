#!/usr/bin/perl

use strict;
use warnings;

while ( <> ) {
   s/^(M106 S(\d+).*)$/$1\nM106 P1 S$2 ;single extruder fan/;
   s/^(M107(\b.*)?)$/$1\nM107 P1 ;single extruder fan/;
   print;
}
