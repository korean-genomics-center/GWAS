##
use warnings;
use strict;
use Cwd;

my $usage = "perl *pl <plink file> <out directory>";
$usage .= "\n\nCheck and modify detailed parameters in this script before you run!!\n\n";
die "\n\n$usage\n\n" unless(@ARGV == 2 );
##

## Basic Parameters ##
my $plink_file = $ARGV[0];
my @Plink_file = split /\//, $plink_file;
my $plink_file_filename =  $Plink_file[-1];
my $tool_plink = <Path to plink>
my $out_directory = $ARGV[1];
unless(-d "$out_directory") {system "mkdir -p $out_directory";}
$ENV{'PATH'} = "<Path to EIG>/EIG-6.1.4/bin:$ENV{'PATH'}";
####


## Write POPgen parameter file ##
open POPgen_parameter, ">$out_directory/par-POPgene_$plink_file_filename";
print POPgen_parameter "genotypename:    $plink_file.bed\n";
print POPgen_parameter "snpname:         $plink_file.bim\n";
print POPgen_parameter "indivname:       $plink_file.fam\n";
print POPgen_parameter "evecoutname:     $out_directory/$plink_file_filename.evec\n";
print POPgen_parameter "evaloutname:     $out_directory/$plink_file_filename.eval\n";
print POPgen_parameter "altnormstyle:    NO\n";
print POPgen_parameter "numoutevec:      10\n";
print POPgen_parameter "numoutlieriter:  0\n";
print POPgen_parameter  "familynames:     NO\n";
close POPgen_parameter;
my $pop_gene_parameter_file = "$out_directory/par-POPgene_$plink_file_filename";
####

## Run smartpca ##
my $command = "smartpca";
$command .= " -p $pop_gene_parameter_file > $pop_gene_parameter_file.log";
print "\n\nSMART PCA!!\n\n$command\n\n";
system "$command\n";
####

## Plot PCA ## PCA
$command = "perl <Path to EIG>/EIG-6.1.4/bin/ploteig";
$command .= " -i $out_directory/$plink_file_filename.evec ";
$command .= " -c 1:2 ";
$command .= " -p ??? ";
$command .= " -x ";
$command .= " -o $out_directory/$plink_file_filename.xtxt";
print "\n\nPLOT PCA!!\n\n$command\n\n";
system "$command\n";
##





