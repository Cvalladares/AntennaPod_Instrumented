#!/bin/sh

if [ "$#" -ne 2 ]; then
    echo "Usage:\n  ./makeRelease 1.2.3rc0 Directory/"
    exit 1
fi

set -e
DEST=$2
VERSION_NAME=$1

# need to get rid of this so that it gets regenerated
# probably a way to solve this in Gradle too...
rm -f app/src/main/assets/about.html
./gradlew clean assemblePlayDebug assemblePlayRelease
cp app/build/outputs/apk/app-play-debug.apk $DEST/AntennaPod_${VERSION_NAME}_debug.apk
cp app/build/outputs/apk/app-play-release.apk $DEST/AntennaPod_${VERSION_NAME}_release.apk
