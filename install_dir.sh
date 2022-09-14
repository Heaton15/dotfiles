#!/bin/bash -e

# Install all files within a directory (non-recursive)
#
# Runs 'install_file.sh' on every file within a directory.
#
# Inputs:
#   $1 : path to source directory.
#   $2 : path to destination directory.
SRC_D="$1"
DST_D="$2"

for f in "$SRC_D"/*; do
    # Skip directories within SRC_D
    if [[ -f "$f" ]]; then
        base_f="$(basename "$f")"
        ./install_file.sh "$f" "$DST_D/$base_f"
    fi
done
