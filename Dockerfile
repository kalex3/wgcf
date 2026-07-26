FROM golang:alpine AS builder

WORKDIR /src

COPY . .

RUN CGO_ENABLED=0 go build -trimpath -ldflags="-s -w" -o wgcf .

FROM scratch

WORKDIR /data

COPY --from=builder /src/wgcf /
COPY --from=builder /etc/ssl/cert.pem /etc/ssl/cert.pem

ENTRYPOINT ["/wgcf"]
