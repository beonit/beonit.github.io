#!/bin/sh
export JEKYLL_VERSION=4.0

docker run -d \
    --rm \
    --name blog \
    -p4000:4000 \
    --volume="$PWD:/srv/jekyll" \
    --volume="$PWD/vendor/bundle:/usr/local/bundle" \
    jekyll/jekyll:${JEKYLL_VERSION} \
    jekyll serve