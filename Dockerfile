# syntax=docker/dockerfile:1

FROM public.ecr.aws/docker/library/node:lts-alpine AS node
# FROM node:lts-alpine AS node

FROM ghcr.io/nguoianphu/alpine-android:android-28-jdk17
# FROM nguoianphu/alpine-android:android-28-jdk17

COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin

LABEL maintainer="Vo Hung Tuan <nguoianphu@gmail.com>"

# Install capacitor
RUN node -v \
 && npm install -g npm npx @ionic/cli \
 && npm install @capacitor/core @capacitor/cli @capacitor/android

WORKDIR /app
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["build"]
