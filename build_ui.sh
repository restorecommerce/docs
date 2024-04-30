#!/bin/sh

set -ex

if [ ! -d "ui" ]; then
    git clone https://gitlab.com/antora/antora-ui-default.git ui
    cd ui

    # Patch-compatible commit hash
    git checkout 0a4f0a2fbdf7c44f589c80693b0be3b27b8d2c30
    git apply ../restorecommerce-docs.patch

    # Remove git root
    rm -rf .git
    npm install
    $(npm root)/.bin/gulp bundle
    cd ..
fi
