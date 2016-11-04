#! /usr/bin/env bash

pandoc "$@" -f markdown -t latex --latex-engine=xelatex  -s -o "$@".pdf
