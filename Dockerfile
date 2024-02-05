FROM ghcr.io/linuxsuren/hd:v0.0.42 as downloader

ARG VERSION=v3.14.0
RUN hd install helm/helm@${VERSION}

FROM alpine:3.19.1

LABEL "repository"="https://github.com/linuxsuren/helm-docker"
LABEL "homepage"="https://github.com/linuxsuren/helm-docker"

WORKDIR /workspace
COPY helm-build-and-push.sh /usr/local/bin
COPY --from=downloader /usr/local/bin/helm /usr/local/bin/helm
