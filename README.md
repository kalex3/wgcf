# wgcf

My fork of [wgcf](https://github.com/ViRb3/wgcf)

## Usage

Create directory for wgcf data

```sh
mkdir data
```

Create account

```sh
docker run --rm -v $(pwd)/data:/data ghcr.io/kalex3/wgcf:latest register --accept-tos
```

Generate WireGuard config

```sh
docker run --rm -v $(pwd)/data:/data ghcr.io/kalex3/wgcf:latest generate
```

Get account status

```sh
docker run --rm -v $(pwd)/data:/data ghcr.io/kalex3/wgcf:latest status
```

Update account

```sh
docker run --rm -v $(pwd)/data:/data ghcr.io/kalex3/wgcf:latest update
```

Generate QR code for the WireGuard mobile app (requires [python-qrcode](https://github.com/lincolnloop/python-qrcode))

```sh
cat data/wgcf-profile.conf | qr
```
