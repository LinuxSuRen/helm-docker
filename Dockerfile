FROM ghcr.io/linuxsuren/hd:v0.0.42 as downloader

ARG VERSION=v3.14.0
WORKDIR /workspace
RUN hd install helm/helm@${VERSION}

COPY helm-build-and-push.sh .
RUN chmod +x helm-build-and-push.sh

FROM alpine:3.19.1

LABEL "repository"="https://github.com/linuxsuren/helm-docker"
LABEL "homepage"="https://github.com/linuxsuren/helm-docker"

WORKDIR /workspace
COPY --from=downloader /workspace/helm-build-and-push.sh .
COPY --from=downloader /usr/local/bin/helm /usr/local/bin/helm
