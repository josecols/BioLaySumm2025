#!/bin/bash
#SBATCH --job-name=biolaysum_eval
#SBATCH --output=biolaysum_eval_%j.out
#SBATCH --error=biolaysum_eval_%j.err

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --gpus-per-node=l40:1
#SBATCH --mem=16G
#SBATCH --time=4:00:00

#SBATCH --export=all
#SBATCH --chdir=/gscratch/scrubbed/jcols/BioLaySumm2025
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=jcols@uw.edu

eval "$(conda shell.bash hook)"
conda activate biolaysum

bash evals.sh 40