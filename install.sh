#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Installing bundle..."
vim -c BundleInstall! -c q -c q -u $DIR/bundles.vim

echo "Done!"
