#!/bin/sh

xelatex -output-directory="./$1" "./${1}/main.tex"

rm -vf ./$1/*.log ./$1/*.aux ./$1/*.idx ./$1/*.toc ./$1/*.synctex.gz ./$1/*.out ./$1/*.dvi ./$1/*.fdb_latexmk ./$1/*.fls ./$1/*.ilg ./$1/*.ind