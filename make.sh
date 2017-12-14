#!/bin/sh

set -eu

if [ $# -lt 1 ]; then
    echo "Usage:" ;
    echo "    $0 <image name>" ;
    echo "Example:" ;
    echo "    $0 gamma" ;
    echo "Note:" ;
    echo "    You should install latexmk ,dvisvgm and dvipng." ;
    echo "    Note that latexmk needs some configurations." ;
    exit 1
fi

set -x

cd "$1"
TEXINPUTS=".:..:$TEXINPUTS" latexmk
dvisvgm "$1.dvi"
dvipng -o "$1.png" "$1.dvi"
