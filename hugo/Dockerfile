FROM alpine:latest as builder
ENV GITHUB_REPO=gohugoio/hugo
RUN apk add --no-cache curl
RUN ! [ -z "${VERSION}" ] || export VERSION=$(curl -w%{url_effective} -Ls -o /dev/null https://github.com/${GITHUB_REPO}/releases/latest | grep -oE "[^/]+$"); \
    curl -L -s https://github.com/${GITHUB_REPO}/releases/download/${VERSION}/hugo_${VERSION#v}_Linux-64bit.tar.gz  | gunzip | tar xv

FROM alpine
WORKDIR /app
COPY --from=builder /hugo /usr/local/bin/hugo
ENTRYPOINT ["hugo"]