#!/bin/bash
#SBATCH --job-name='par500'
#SBATCH -p short
#SBATCH --mem=10G

module load R/3.5.1

echo "*--start--*"
R CMD BATCH par_gv_N_500.R
echo "*--done--*\n\n"
echo $(date)
