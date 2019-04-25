#!/bin/bash
# by gunnarpope on 4/25/19

if [[ $# -ne 2 ]]; then
    echo "USAGE: find_replace_recursive.sh <Old-String> <New-String> from within the directory"
    exit 1
fi

grep -rl "$1" ./ | xargs sed -i "s/$1/$2/g"
