#!/bin/bash
#SBATCH --job-name='5 200'
#SBATCH -p short
#SBATCH --mem=10G

module load R/3.5.1

echo "*--start--*"
R CMD BATCH bay_gv_nc_5_N_200.R
echo "*--done--*\n\n"
echo $(date)
