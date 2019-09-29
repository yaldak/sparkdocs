#!/usr/bin/env bash

# use `brew install pcre` to get pcregrep on Mac

## Vale check
echo "Running vale..."
vale --glob='*.adoc' src/

echo

## Whitespace check
echo "Checking for trailing whitespace..."
grep --color='auto' -r --include='*.adoc' '[[:blank:]]$' ./src

if [ $? -eq 1 ]; then
    echo "No trailing whitespace found."
fi

echo

## Tab check
echo "Checking for tab characters..."
pcregrep --include='.+\.adoc$' --color='auto' -r -n '\t' ./src

if [ $? -eq 1 ]; then
    echo "No tab characters found."
fi

echo

## Non-ASCII check
echo "Checking for non-ASCII characters..."
pcregrep --include='.+\.adoc$' --color='auto' -r -n '[^\x00-\x7F]' ./src

if [ $? -eq 1 ]; then
    echo "No non-ASCII characters found."
fi

echo
