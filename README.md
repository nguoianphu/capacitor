# Docker capacitor builder

Provide your html5/web app __dist__ output directory and this docker will convert it to Android 9.0 (28) project and build it to debug .apk file.

## Prepare
Build your html5/web app and get a __dist__ directory.

Create a directory __app__ and put the __dist__ inside.

Put your __package.json__ into __app__ also


    app
        dist
        package.json

## Convert web app to android and build

At same folder level with __app__ directory (outside __app__), run

    docker run --rm -it -v ./app:/app ghcr.io/nguoianphu/capacitor

    # docker run --rm -it -v ./app:/app nguoianphu/capacitor

It will initialize capacitor into __app__ folder and generate folder __android__. Then it will build the android with __assembleDebug__ command.

The debug apk file will be available at __app/android/app/build/outputs/apk/debug/__

## More

This images contains many Android and nodejs tools, you can try others commands as well

[https://hub.docker.com/r/nguoianphu/capacitor](https://hub.docker.com/r/nguoianphu/capacitor)

or

[https://github.com/users/nguoianphu/packages/container/package/capacitor](https://github.com/users/nguoianphu/packages/container/package/capacitor)

    docker run --rm -it -v ./app:/app ghcr.io/nguoianphu/capacitor bash

    # docker run --rm -it -v ./app:/app nguoianphu/capacitor bash
    
    # Build android
    cd android
    export GRADLE_USER_HOME=/app/android/.gradle
    ./gradlew tasks
    ./gradlew assembleDebug

## Docs

[https://capacitorjs.com/docs/android](https://capacitorjs.com/docs/android)

## Github Action

Refer this github action if you want to build everything on github: [https://github.com/nguoianphu/pkmn.help/blob/vitejs/.github/workflows/build.yml](https://github.com/nguoianphu/pkmn.help/blob/vitejs/.github/workflows/build.yml)
