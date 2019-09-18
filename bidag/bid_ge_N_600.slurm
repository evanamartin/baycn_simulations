#!/bin/bash
#SBATCH --job-name='bid600'
#SBATCH -p short
#SBATCH --mem=10G

module load R/3.5.1

echo "*--start--*"
R CMD BATCH bid_ge_N_600.R
echo "*--done--*\n\n"
echo $(date)
