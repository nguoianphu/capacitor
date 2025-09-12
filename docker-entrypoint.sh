#!/usr/bin/env sh
set -Eeuo pipefail

if [[ "$1" == "build" ]]; then
    cd /app
    if [[ ! -d dist ]]; then
        echo "Please put the dist directory into app directory!"
        echo "Make sure to mount the app direcory when running, like this"
        echo "docker run --rm -it -v "./app:/app" capacitor"
        exit 1
    fi
    if [[ ! -f package.json ]]; then
        echo "Your app doesn't have a package.json!"
        echo "Using an example package.json"
        cp /nodejs/package.json .
    fi
    cp -fr /nodejs/node_modules .
    rm -rf capacitor.config.ts android
    npm install
    echo n | npx cap init MyApp com.myapp --web-dir dist
    echo n | npx cap add android
    echo n | npx cap sync
    cd android
    export GRADLE_USER_HOME=/app/android/.gradle
    chmod +x gradlew
    ./gradlew assembleDebug
else
    exec "$@"
fi
