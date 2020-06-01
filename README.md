# Introduction
This is Protocol/code for genome-wide association study in  
"Korean Genome Project: 1094 Korean personal genomes with clinical information" paper
(https://advances.sciencemag.org/content/6/22/eaaz7835)


# Usage

## Simple Usage  
Step 1. Prepare principle components by using "Analyze_PCA_ByUsingSMARTPCA.pl"  
Step 2. Perform genome-wide association study by using "Analyze_AssociationByGWAS_ByUsingPLINK.sh"  
Step 3. Draw manhattan plot and q-q plot by using "Draw_QQPlotAndManhattanPlot_ByUsingQQMAN.R"  


## Detailed Usage 

### Step 1. Prepare principle components by using "Analyze_PCA_ByUsingSMARTPCA.pl"

#### Inputs
1. PLINK formatted file  
2. Output directory  

#### Run
perl Analyze_PCA_ByUsingSMARTPCA.pl <File: Plink file> <Path: output directory>  

#### Citation
1. Principal components analysis corrects for stratification in genome-wide association studies.  


### Step 2. Perform genome-wide association study by using "Analyze_AssociationByGWAS_ByUsingPLINK.sh

#### Inputs
1. PLINK Program
```
Downloadable at here
https://www.cog-genomics.org/plink/1.9/
```

2. PLINK binalry formatted file
```
example
plink.bed
plink.fam
plink.bim
```

3. Phenotype file
```
Format as below
FID\tIID\tPhenotypeA\tPhenotypeB\tPhenotypeC\n
Alpha\tAlpha\t1\t-1.3\t0.9\n
Beta\tBeta\t1\t1.1\t0.4\n
Gamma\tGamma\t0\t1.2\t1.6\n
```

4. The name of target phenotype
5. Covariate file
6. The name of target covarate
7. The name of output file





