# syntax=docker/dockerfile:1

FROM nguoianphu/alpine-android:android-28-jdk17

LABEL maintainer="Vo Hung Tuan <nguoianphu@gmail.com>"

# Install nodejs and capacitor
WORKDIR /nodejs
RUN apk add nodejs npm \
 && npm install -g npm npx @ionic/cli \
 && npm install @capacitor/core @capacitor/cli @capacitor/android

WORKDIR /app
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["build"]