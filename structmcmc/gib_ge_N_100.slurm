#!/bin/bash
#SBATCH --job-name='gib100'
#SBATCH -p reg
#SBATCH --mem=10G

module load R/3.5.1

echo "*--start--*"
R CMD BATCH gib_ge_N_100.R
echo "*--done--*\n\n"
echo $(date)
