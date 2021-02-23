
# renovate: datasource=docker depName=php versioning=docker
ARG PHP_VERSION=7.4

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.0.10

FROM renovate/buildpack:4-php@sha256:d65e084256775ee82a628208bf2b1c4f34833e5ed42891212f354486ed1e4c60

ARG PHP_VERSION
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
  org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
