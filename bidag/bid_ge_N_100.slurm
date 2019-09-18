#!/bin/bash
#SBATCH --job-name='bid100'
#SBATCH -p short
#SBATCH --mem=10G

module load R/3.5.1

echo "*--start--*"
R CMD BATCH bid_ge_N_100.R
echo "*--done--*\n\n"
echo $(date)
