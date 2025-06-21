package Kappa::Tank;

##############################################################################
# $Id: Tank.pm 32 2008-01-16 19:06:44Z kschwind $
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
    public   name       => my %name, {
                                    set_hook => sub { /^[^\s].*[^\s]$/mix or croak 'Name cannot start or end with spaces.';}
                                    };
    public   xcord      => my %xcord, {
                                    set_hook => sub { /^\d+$/mix or croak 'Coordinates are integer only.';}
                                    };
    public   ycord      => my %ycord, {
                                    set_hook => sub { /^\d+$/mix or croak 'Coordinates are integer only.';}
                                    };
    public   direction  => my %direction, {
                                    set_hook => sub { /^\d+$/mix or croak 'Direction is integer only.';}
                                    };
    public   script     => my %tankprogram;# The program for the tank to run.
    private  filename   => my %filename;
    private  contents   => my %contents;
    public   ping       => my %ping, { set_hook => sub { /0|1/gmix or croak 'Ping can only be 1 or 0'; } };
    public   gunidx     => my %gunindex, {
                                    set_hook => sub { /^\d+$/mix or croak 'Gun Index is integer only.';}
                                    };
    public   scanneridx => my %scanner, {
                                    set_hook => sub { /^\d+$/mix or croak 'Scanner Index is integer only.';}
                                    };
    public   budget     => my %budget, {
                                    set_hook => sub { /^\d+$/mix or croak 'Budget is integer only.';}
                                    };
    readonly version    => my %version;  



    sub new { 
        my ($class, $filename) = @_;
        my $self = \(my $scalar);   # Anonymous scalar
        bless $self, $class;
        $name{id $self} = " Not Initialized ";
        $filename{id $self} = $filename;
        read_tankfile($filename{id $self});
        register($self) ;
        return;
    }

    sub read_tankfile {
        my ($infile, $self) = @_;
        open my $SLURP, '<', $infile or croak "Unable to open [$infile] : $!";
        $contents{id $self} = do{ local $/; <$SLURP>};
        close $SLURP or croak "Cannot close [$infile] : $!";
        return;
    }


} # end of internal scoping.
1;
