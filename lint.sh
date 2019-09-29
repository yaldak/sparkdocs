#!/usr/bin/env bash

vale --glob='*.adoc' src/

echo "Checking for trailing whitespace..."
grep --color='auto' -r --include='*.adoc' '[[:blank:]]$' ./src

# use `brew install pcre` to get pcregrep on Mac

echo "Checking for tab characters..."
pcregrep --include='.+\.adoc$' --color='auto' -r -n '\t' ./src

echo "Checking for sketchy characters..."
pcregrep --include='.+\.adoc$' --color='auto' -r -n '[^\x00-\x7F]' ./src
