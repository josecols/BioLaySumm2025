#!/bin/bash
#SBATCH --job-name=sumeval
#SBATCH --output=sumeval_%j.out
#SBATCH --error=sumeval_%j.err

#SBATCH --account=stf
#SBATCH --partition=ckpt-all
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --gpus-per-node=l40:1
#SBATCH --mem=16G
#SBATCH --time=8:00:00

#SBATCH --export=all
#SBATCH --chdir=/gscratch/scrubbed/jcols/BioLaySumm2025
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=jcols@uw.edu

eval "$(conda shell.bash hook)"
conda activate biolaysum

python evaluation_final.py \
  --prediction_file elife_validation_llama.json \
  --groundtruth_file elife_validation_llama.json \
  --task_name "lay_summ" \
  > elife_validation_llama.eval.txt