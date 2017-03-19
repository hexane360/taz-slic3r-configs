#!/usr/bin/perl

use strict;
use warnings;

our $^I = '.bak';
while ( <> ) {
   s/^(M106 S(\d*).*)$/${1}\nM106 P1 S${2} ;single extruder fan/;
   print;
}
