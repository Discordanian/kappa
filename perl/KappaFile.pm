package KappaFile;

##############################################################################
# $Id: KappaTank.pm 25 2007-12-18 17:17:21Z kschwind $
##############################################################################
use strict;
use warnings;
use Carp qw(carp cluck croak confess);
use Data::Dumper;
use Class::InsideOut qw(:std);
use Diget::MD5 qw(md5_hex);

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
    public   filename       => my %filename;
    public   tankname       => my %tankname;
    public   version        => my %version;
    public   budget         => my %budget;
    public   gun            => my %gun;
    public   scanner        => my %scanner;
    public   ping           => my %ping;
    
    sub new { 
        my ($class, $slurpedscript) = @_;
        my $self = \(my $scalar);   # Anonymous scalar
        bless $self, $class;
        $scriptcontents{id $self} = "Not Initialized";
        register($self) ;
    }


} # end of internal scoping.
1;
