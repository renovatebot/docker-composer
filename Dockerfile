# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=1.10.7

FROM renovate/buildpack:2-php@sha256:552901264f0f7fbe63362bcdb898f3c9b052a60b3fd5953d1ba6db37f5dfd2b1

# renovate: datasource=docker depName=php versioning=docker
ARG PHP_VERSION=7.4
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
      org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
