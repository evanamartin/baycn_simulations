#!/bin/bash
#SBATCH --job-name='2 500'
#SBATCH -p short
#SBATCH --mem=10G

module load R/3.5.1

echo "*--start--*"
R CMD BATCH bay_gv_m2_nc_2_N_500.R
echo "*--done--*\n\n"
echo $(date)
