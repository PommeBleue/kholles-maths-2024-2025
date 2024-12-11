#!/bin/sh

base_dir=$(cat ./scripts/base_dir)

if [[ $2 == "" ]]; then 
    xelatex -output-directory="./$1" "./${1}/main.tex"
else
    xelatex -output-directory="./$1" "./${1}/${2}.tex"
    if [ ! -d $base_dir/$1 ]; then
        mkdir $base_dir/$1
    fi
    cp ./$1/$2.pdf $base_dir/$1/$2.pdf
fi

git add .