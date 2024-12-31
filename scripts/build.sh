#!/bin/sh

base_dir=$(cat ./scripts/base_dir)
output_dir="./$1"
tex_file="${2:-main}.tex"
pdf_file="${2:-main}.pdf"

xelatex -output-directory="$output_dir" "$output_dir/$tex_file"

if [ -n "$2" ]; then
    target_dir="$base_dir/$1"
    [ ! -d "$target_dir" ] && mkdir -p "$target_dir"
    cp "$output_dir/$pdf_file" "$target_dir/$pdf_file"
fi

# Check if there are changes to commit
if ! git diff-index --quiet HEAD --; then
    git add .
    git commit -m "Adding $tex_file and $pdf_file"
    git push origin main
else
    echo "No changes to commit"
fi