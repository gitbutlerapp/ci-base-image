FROM ubuntu:jammy-20240627.1 AS base

# The final block is Playwright chromium system dependencies for Ubuntu 22.04,
# so `playwright install` in CI does not need `--with-deps`.
RUN apt-get update && \
    apt-get install -y \
        libwebkit2gtk-4.0-dev libwebkit2gtk-4.1-dev build-essential curl wget \
        libssl-dev libgtk-3-dev libayatana-appindicator3-dev librsvg2-dev \
        jq tar bash libbrotli-dev brotli imagemagick git cmake \
        libnspr4 libnss3 libasound2 libatk-bridge2.0-0 libdrm2 \
        libxcomposite1 libxdamage1 libxfixes3 libxrandr2 libgbm1 \
        libxkbcommon0 libpango-1.0-0 libcairo2 libcups2

RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly -y

ENV PATH="/root/.cargo/bin:${PATH}"

WORKDIR /ci

FROM base
