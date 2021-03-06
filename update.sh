#!/bin/sh
set -e
VERSION=$1
[ -z "$VERSION" ] && echo "Usage: ./update.sh <VERSION>" && exit 1
cd `dirname $0`

# Modify an existing branch/submodule to point to a different commit (or HEAD by default).
git submodule update --remote --merge $VERSION
git add $VERSION
git commit -m "Updating version $VERSION"
git push
