#!/usr/bin/env perl

use Statistics::R;
use strict;
use warnings;

print "Enter the full path to Tax4Fun Silva Reference DATA folder:\n";
chomp (my $tax4fun_silva=<STDIN>);#dummy
print "$tax4fun_silva\n";

print "Enter FOLDER path of the QIIME biom tsv\n(please enter path with final '/')";
my $outfolder=<STDIN>;
print "Enter Filename of the QIIME tsv (with extentesion)";
my $biomin=<STDIN>

print "\n\n Runing Tax4Fun\n\n";
my $qiimein=$outfolder.$biomin;
my$qiimeout=$outfolder."/Tax4FunOutput.tsv";
#print $qiimein;

my $R = Statistics::R->new();
my $cmds = <<EOF;
library(Tax4Fun)
myQiimeBiom<-importQIIMEData("$qiimein")
folderReferenceData <- "$tax4fun_silva"
Tax4FunOut <- Tax4Fun(myQiimeBiom, folderReferenceData)
AbundanceProfile <- data.frame(t(Tax4FunOut\$Tax4FunProfile))
write.table(AbundanceProfile,"$qiimeout",sep="\\t",col.names=NA)
print(Tax4FunOut)
EOF

print "\n\n$cmds\n\n";

my $out = $R->run($cmds);
print $out;


print "\n\n done\n\n";
