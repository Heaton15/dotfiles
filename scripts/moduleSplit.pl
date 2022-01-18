#!/usr/bin/perl -w

eval 'exec /usr/bin/perl -w -S $0 ${1+"$@"}'
    if 0; # not running under some shell
# See copyright, etc in below POD section.
######################################################################

use lib 'blib/lib';
use Verilog::EditFiles;
use FindBin qw($RealBin $RealScript $Script);
use strict;

my $split = Verilog::EditFiles->new
    (outdir => "newSrc",              # Create a directory with the passed name in the same location this script sits
     translate_synthesis => 0,
     lint_header  => undef,
     celldefine => 0,
    );

$split->read_and_split(glob("*.v")); # src is the directory that the .v you are extracting the modules from sits. 
$split->read_and_split(glob("*.sv")); # src is the directory that the .v you are extracting the modules from sits. 
$split->write_files();
