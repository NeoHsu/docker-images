ARG VERSION
FROM golang:${VERSION}-buster
ENV CGO_ENABLED=1
RUN apt-get update && apt-get install -y --no-install-recommends upx