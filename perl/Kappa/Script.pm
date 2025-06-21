package KappaScript;

##############################################################################
# $Id: KappaTank.pm 25 2007-12-18 17:17:21Z kschwind $
##############################################################################
use strict;
use warnings;
use Carp qw(carp cluck croak confess);
use Data::Dumper;
use Class::InsideOut qw(:std);

##############################################################################
# 'Globals'.  
##############################################################################
our $VERSION = '0.1b';
{
    ##############################################################################
    # The inner sanctum of the object.  These aren't touchable outside of the 
    # object itself.
    ##############################################################################
    private  scriptcontents => my %scriptcontents;


    sub new { 
        my ($class, $slurpedscript) = @_;
        my $self = \(my $scalar);   # Anonymous scalar
        bless $self, $class;
        $scriptcontents{id $self} = "Not Initialized";
        register($self) ;
    }


} # end of internal scoping.
1;
