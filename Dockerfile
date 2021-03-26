
# renovate: datasource=docker depName=php versioning=docker
ARG PHP_VERSION=7.4

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.0.11

FROM renovate/buildpack:4-php@sha256:0cb75cc18726c5781c6366ce956fe77d2b43ce3bd4a5e3983fa521b7231c87f7

ARG PHP_VERSION
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
  org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
