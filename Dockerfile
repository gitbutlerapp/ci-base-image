FROM ubuntu:jammy-20240627.1 AS base

# Playwright browser deps (chromium + webkit) and blackbox e2e packages
# (webkit2gtk-driver, ffmpeg, xvfb), so downstream workflows don't need
# apt-get install at runtime.
RUN apt-get update && \
    apt-get install -y \
        libwebkit2gtk-4.0-dev libwebkit2gtk-4.1-dev build-essential curl wget \
        libssl-dev libgtk-3-dev libayatana-appindicator3-dev librsvg2-dev \
        jq tar bash libbrotli-dev brotli imagemagick git cmake \
        libnspr4 libnss3 libasound2 libatk-bridge2.0-0 libdrm2 \
        libxcomposite1 libxdamage1 libxfixes3 libxrandr2 libgbm1 \
        libxkbcommon0 libpango-1.0-0 libcairo2 libcups2 \
        webkit2gtk-driver ffmpeg xvfb \
        libgtk-4-1 libevent-2.1-7 gstreamer1.0-plugins-bad \
        libflite1 libavif13 libx264-163

RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly -y

ENV PATH="/root/.cargo/bin:${PATH}"

WORKDIR /ci

FROM base
