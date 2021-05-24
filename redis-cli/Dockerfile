FROM alpine:latest as builder
ARG VERSION
RUN apk add --no-cache --virtual .build-deps \
		coreutils \
		dpkg-dev dpkg \
		gcc \
		linux-headers \
		make \
		musl-dev \
		openssl-dev \
		wget \
        ca-certificates \
	; \
	\
	wget -O redis.tar.gz http://download.redis.io/releases/redis-${VERSION}.tar.gz; \
	echo "redis ${VERSION} *redis.tar.gz"; \
	mkdir -p /usr/src/redis; \
	tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1; \
	rm redis.tar.gz; \
	cd /usr/src/redis; \
    make;

FROM alpine:latest
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /usr/src/redis/src/redis-cli /redis-cli
ENTRYPOINT ["/redis-cli"]
