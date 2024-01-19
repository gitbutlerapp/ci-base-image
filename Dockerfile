FROM ubuntu:noble-20240114

RUN apt-get update && \
    apt-get install -y \
        libwebkit2gtk-4.0-dev build-essential curl wget \
        libssl-dev libgtk-3-dev libayatana-appindicator3-dev librsvg2-dev \
        jq tar bash libbrotli-dev brotli imagemagick

RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly -y

WORKDIR /ci
