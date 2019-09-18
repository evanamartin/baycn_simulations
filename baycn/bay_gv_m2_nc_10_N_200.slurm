#!/bin/bash
#SBATCH --job-name='10 200'
#SBATCH -p short
#SBATCH --mem=10G

module load R/3.5.1

echo "*--start--*"
R CMD BATCH bay_gv_m2_nc_10_N_200.R
echo "*--done--*\n\n"
echo $(date)
