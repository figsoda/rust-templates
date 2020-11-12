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

sd -s "<<name>>" "$3" ./**
sd -s "<<authors>>" "$4" ./**
sd -s "<<github>>" "$5" ./**

git init
git remote add origin "https://github.com/$5.git"
git add .
git commit -m "initial commit"
git branch -m main
git branch --set-upstream-to=origin/main main
