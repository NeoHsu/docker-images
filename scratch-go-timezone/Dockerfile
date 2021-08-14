FROM golang:alpine as builder

FROM neohsudroid/scratch
COPY --from=builder /usr/local/go/lib/time/zoneinfo.zip /zoneinfo.zip
ENV ZONEINFO=/zoneinfo.zip