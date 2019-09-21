#!/usr/bin/env bash

OUTDIR="$(pwd)/dist/pdf"

rm -rf "$OUTDIR/*"
mkdir -p "$OUTDIR"
cp -r src/* "$OUTDIR"

docker run --rm -v "$OUTDIR:/documents/" asciidoctor/docker-asciidoctor \
    asciidoctor-pdf \
    -a drawio-extension=.rendered.png \
    -a relative-ext=.pdf \
    -r asciidoctor-diagram,asciidoctor-mathematical \
    '**/*.adoc'
