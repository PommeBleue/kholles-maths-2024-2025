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
    created_files=$(git diff --name-only --diff-filter=A HEAD)
    updated_files=$(git diff --name-only --diff-filter=M HEAD)
    deleted_files=$(git diff --name-only --diff-filter=D HEAD)
    commit_message_parts=()

    echo $created_files
    echo $updated_files
    echo $deleted_files

    [ -n "$created_files" ] && commit_message_parts+=("Added $(echo $created_files | tr '\n' ' ')")
    [ -n "$updated_files" ] && commit_message_parts+=("Updated $(echo $updated_files | tr '\n' ' ')")
    [ -n "$deleted_files" ] && commit_message_parts+=("Deleted $(echo $deleted_files | tr '\n' ' ')")

    commit_message=$(IFS='; '; echo "${commit_message_parts[*]}")

    git commit -m "$commit_message"
    git push origin main
else
    echo "No changes to commit"
fi