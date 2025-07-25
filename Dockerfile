ARG AMD64_BINARY
ARG ARM64_BINARY

FROM --platform=$BUILDPLATFORM alpine:3.20

RUN apk add --no-cache ffmpeg

# Copy the right binary depending on target platform
COPY ${AMD64_BINARY} /usr/local/bin/unflac-amd64
COPY ${ARM64_BINARY} /usr/local/bin/unflac-arm64

# Use platform-specific binary with a symlink or script wrapper
RUN if [ "$(uname -m)" = "x86_64" ]; then \
      ln -sf /usr/local/bin/unflac-amd64 /usr/local/bin/unflac; \
    else \
      ln -sf /usr/local/bin/unflac-arm64 /usr/local/bin/unflac; \
    fi

ENTRYPOINT ["unflac"]
