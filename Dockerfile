FROM alpine:3.20
RUN apk add --no-cache ffmpeg
COPY unflac-linux-amd64 /usr/local/bin/unflac
RUN chmod +x /usr/local/bin/unflac
ENTRYPOINT ["unflac"]
