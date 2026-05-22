#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <paper.pdf> [output_dir]"
  exit 1
fi

PDF_PATH="$1"
OUT_DIR="${2:-figures/raw}"

if [[ ! -f "$PDF_PATH" ]]; then
  echo "Error: PDF not found: $PDF_PATH"
  exit 1
fi

mkdir -p "$OUT_DIR"

# Lossless extraction of embedded raster images (highest possible quality from source PDF)
pdfimages -all "$PDF_PATH" "$OUT_DIR/image"

echo "Done. Extracted files in: $OUT_DIR"
ls -lh "$OUT_DIR"
