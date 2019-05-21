#!/bin/bash
# by gunnarpope on 4/25/19

if [[ $# -ne 2 ]]; then
    echo "USAGE: "
	echo "	$ ./find_replace_recursive.sh <Old-String> <New-String>"
	echo "--------------------------------------------------------------"
	echo "Finds and replaces a string from within the current directory."
	echo "Note: <New-String> must use a backslash before control characters."
	echo "Use <$ git diff> to find the changes that were made."
    exit 1
fi

grep -rl "$1" ./ | xargs sed -i "s/$1/$2/g"
