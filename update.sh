#!/bin/sh

OLDPWD=$PWD
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR
echo "Pulling changes..."
git pull

echo "Updating bundle..."
vim -c BundleInstall! -c BundleClean! -c q -c q

cd $OLDPWD

echo "Done!"
