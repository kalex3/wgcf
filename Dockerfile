FROM golang:alpine AS builder

WORKDIR /src
COPY . .

RUN apk add --no-cache git && go mod download && CGO_ENABLED=0 go build -ldflags="-s -w" -o "wgcf"

FROM alpine:latest

WORKDIR /

COPY --from=builder "/src/wgcf" "/"

ENTRYPOINT ["/wgcf"]
