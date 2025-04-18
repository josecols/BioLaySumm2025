#!/bin/bash
#SBATCH --job-name=biolaysum_eval
#SBATCH --output=biolaysum_eval_%j.out
#SBATCH --error=biolaysum_eval_%j.err

#SBATCH --account=stf
#SBATCH --partition=gpu-l40
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --gpus-per-node=l40:1
#SBATCH --mem=32G
#SBATCH --time=14:00:00

#SBATCH --export=all
#SBATCH --chdir=/gscratch/scrubbed/jcols/BioLaySumm2025
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=jcols@uw.edu

eval "$(conda shell.bash hook)"
conda activate biolaysum

bash evals.sh 30