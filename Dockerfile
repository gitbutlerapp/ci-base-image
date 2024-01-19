FROM ubuntu:noble-20240114

RUN apt-get update && \
    apt-get install \
        libwebkit2gtk-4.0-dev build-essential curl wget \
        libssl-dev libgtk-3-dev libayatana-appindicator3-dev librsvg2-dev

WORKDIR /src

RUN mkdir gitbutler-ui/build
