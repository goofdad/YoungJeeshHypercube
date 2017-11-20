#!/usr/bin/perl

my $F, $O;
open $F,"partlist.txt" or die "Cannot open partlist.txt";

while (my $line=<$F>) {
    if ($line =~ /.*draw(.*)\(/) {
	open $O, '>', "$1.scad" or die "Cannot open $1.scad for writing";
	print $O "include <lib/HyperQbert.inc>\n";
	print $O "$line\n";
    }
}

