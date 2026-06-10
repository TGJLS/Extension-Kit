FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    make \
    build-essential \
    python3 \
    gcc-mingw-w64-x86-64 \
    g++-mingw-w64-x86-64 \
    gcc-mingw-w64-i686 \
    g++-mingw-w64-i686 \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone --branch dev https://github.com/Adaptix-Framework/Extension-Kit /ext && \
    cd /ext && \
    (git fetch origin pull/139/head:pr-139 && git merge --no-edit pr-139 || true) && \
    make all

WORKDIR /ext
