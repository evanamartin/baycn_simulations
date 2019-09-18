#!/bin/bash
#SBATCH --job-name='baycn 200'

echo $(hostname)
echo $(date)
module load R/3.4.3

echo "*--start--*"
R CMD BATCH bay_gv_N_200.R
echo "*--done--*\n\n"
echo $(date)
