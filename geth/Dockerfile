# Build Geth in a stock Go builder container
FROM golang:1.9-alpine as builder

RUN apk add --no-cache make gcc git musl-dev linux-headers

RUN git clone https://github.com/ethereum/go-ethereum
RUN cd /go-ethereum && make all

# Pull Geth into a second stage deploy alpine container
FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /go-ethereum/build/bin/geth /usr/local/bin/

EXPOSE 8545 8546 30303 30303/udp 30304/udp
ENTRYPOINT ["geth"]
