#!/bin/sh

if [[ $2 == "" ]]; then 
    xelatex -output-directory="./$1" "./${1}/main.tex"
else
    xelatex -output-directory="./$1" "./${1}/${2}.tex"
fi