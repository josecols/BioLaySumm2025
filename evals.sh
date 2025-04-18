#!/bin/bash
set -euo pipefail

RESULT_DIR="data/processed/results"
mkdir -p "$RESULT_DIR"

TASK_NAME="lay_summ"

for json in data/processed/length_*/*.json; do
  subdir=$(basename "$(dirname "$json")")
  base=$(basename "$json" .json)

  out="${subdir}_${base}.txt"

  echo "Running evaluation on $json → $RESULT_DIR/$out"
  python evaluation_final.py \
    --prediction_file "$json" \
    --groundtruth_file "$json" \
    --task_name "$TASK_NAME" \
    > "$RESULT_DIR/$out"
done