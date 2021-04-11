#!/bin/sh

set -ex

if [ ! -d "ui" ]; then
    git clone https://gitlab.com/antora/antora-ui-default.git ui
    cd ui

    # Patch-compatible commit hash
    git checkout 4f54fb8f47a51bdb37140f176ddbe1a6a5ecb1c1
    git apply ../restorecommerce-docs.patch

    # Remove git root
    rm -rf .git
    npm install
    $(npm bin)/gulp bundle
    cd ..
fi
