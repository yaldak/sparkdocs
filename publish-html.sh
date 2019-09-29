#!/usr/bin/env bash

OUTDIR="$(pwd)/dist/html"

rm -rf "$OUTDIR/*"
mkdir -p "$OUTDIR"
cp -r docs/* "$OUTDIR"

docker run --rm -v "$OUTDIR:/documents/" asciidoctor/docker-asciidoctor \
    asciidoctor \
    -a relative-ext=.html \
    -r asciidoctor-diagram,asciidoctor-mathematical \
    '**/*.adoc'

# -a stylesheet=./github.css -a linkcss=false
