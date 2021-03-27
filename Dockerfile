
# renovate: datasource=docker depName=php versioning=docker
ARG PHP_VERSION=7.4

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.0.11

FROM renovate/buildpack:4-php@sha256:a072a4be93ce5ed282a08d50f3b3db8bf6f2e17f9d1b4399b64f2430e80f5903

ARG PHP_VERSION
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
  org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
