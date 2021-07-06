
# renovate: datasource=github-releases depName=containerbase/php-prebuild
ARG PHP_VERSION=7.4.21

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.1.3

FROM renovate/buildpack:5-php@sha256:2799de509feb147505cedc72008b7890c5fcc712c835793ddc52028cea69a73b

ARG PHP_VERSION
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
  org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
