FROM renovate/buildpack@sha256:2a94923b7bb1956f5faf1c82b4578436774e13786ce4f693a713b63185e88af2

ARG PHP_VERSION=7.4
RUN install-tool php

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=1.10.5
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
      org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
