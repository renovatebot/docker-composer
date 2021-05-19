
# renovate: datasource=github-releases depName=containerbase/php-prebuild
ARG PHP_VERSION=7.4.19

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.0.13

FROM renovate/buildpack:5-php@sha256:c697cbaf91e7e9c2a637ee93d703c583018cdc537cf38f376b0e1907b27f1d06

ARG PHP_VERSION
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
  org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
