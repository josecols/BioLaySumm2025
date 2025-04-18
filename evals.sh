#!/bin/bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <length>"
  echo "  e.g. $0 30"
  exit 1
fi

LENGTH=$1
RESULT_DIR="data/processed/results/${LENGTH}"
mkdir -p "$RESULT_DIR"

TASK_NAME="lay_summ"

for json in data/processed/length_${LENGTH}/*.json; do
  subdir=$(basename "$(dirname "$json")")
  base=$(basename "$json" .json)
  out="${subdir}_${base}.txt"

  echo "Running evaluation on $json → $RESULT_DIR/$out"
  time python evaluation_final.py \
    --prediction_file "$json" \
    --groundtruth_file "$json" \
    --task_name "$TASK_NAME" \
    > "$RESULT_DIR/$out"
done