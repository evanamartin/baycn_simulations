#!/bin/bash
#SBATCH --job-name='mc3600'
#SBATCH -p reg
#SBATCH --mem=10G

module load R/3.5.1

echo "*--start--*"
R CMD BATCH mc3_ge_N_600.R
echo "*--done--*\n\n"
echo $(date)
