#!/bin/sh

export GITEXTENSIONS_DIR=$(dirname "$(echo "$0" | sed -e 's,\\,/,g')")
. "${GITEXTENSIONS_DIR}/../lib/util"

# checkout stable
if [ `getCurrentBranch` != "stable" ]; then
    git checkout stable
    if [ $? -ne 0 ]; then
        git checkout -t origin/stable
    fi
fi

# merge master
git merge master
if [ $? -ne 0 ]; then
    echoError "failed to merge from master to stable"
    exit 1
fi

# make tag and push
TAGNAME=v`cat ${GITEXTENSIONS_DIR}/../VERSION`
git tag $TAGNAME
git push origin stable
git push origin $TAGNAME
