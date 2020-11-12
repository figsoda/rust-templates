#!/bin/sh

set -e

[ $# -ne 5 ] && exit 1

echo "Generating from $1"
echo "directory: $2"
echo "name: $3"
echo "authors: $4"
echo "github: $5"

cp -r "$1" "$2"
cd "$2"

files=$(find)
sd -s "<<name>>" "$3" $files
sd -s "<<authors>>" "$4" $files
sd -s "<<github>>" "$5" $files

git init
git remote add origin "https://github.com/$5.git"
git add .
git commit -m "initial commit"
git branch -m main
