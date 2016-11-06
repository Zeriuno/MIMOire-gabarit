#! /usr/bin/env bash

filename="$@"
basename="${filename%.*}"
pandoc "$@" -f markdown -t latex --latex-engine=xelatex  -s -o "$basename".pdf
