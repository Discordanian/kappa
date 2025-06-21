#!/usr/bin/perl
##############################################################################
# $Id: test_KappaTank.pl 31 2007-12-20 17:28:58Z kschwind $
##############################################################################
use strict;
use warnings;
use Data::Dumper;
use Kappa::Tank;

our $VERSION = '0.1b';

my $tank = Kappa::Tank->new('filename');

print $tank->name();
print "\n";
print $tank->name('XBob');
print "\n";
print $tank->name();
print "\n";

# print $tank->show_internals();
print "\n";


