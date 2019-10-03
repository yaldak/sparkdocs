#!/usr/bin/env bash

# use `brew install pcre` to get pcregrep on Mac

## Vale check
echo "Running vale..."
vale --glob='*.adoc' docs/

echo

## Whitespace check
echo "Checking for trailing whitespace..."
grep --color='auto' --include='*.adoc' -r -n '[[:blank:]]$' ./docs

if [ $? -eq 1 ]; then
    echo "No trailing whitespace found."
fi

echo

## Tab check
echo "Checking for tab characters..."
pcregrep --color='auto' --include='.+\.adoc$' -r -n '\t' ./docs

if [ $? -eq 1 ]; then
    echo "No tab characters found."
fi

echo

## Non-ASCII check
echo "Checking for non-ASCII characters..."
pcregrep --color='auto' --include='.+\.adoc$' -r -n '[^\x00-\x7F]' ./docs

if [ $? -eq 1 ]; then
    echo "No non-ASCII characters found."
fi

echo

## Line length check
echo "Checking for lines longer than 80 characters..."
grep --color='auto' --include='*.adoc' -r -n '.\{81\}' ./docs

if [ $? -eq 1 ]; then
    echo "No lines longer than 80 characters found."
fi

echo

## FIXME check
echo "Checking for FIXMEs..."
grep --color='auto' --include='*.adoc' -i -r -n 'FIXME' ./docs

if [ $? -eq 1 ]; then
    echo "No FIXMEs found."
fi

echo
