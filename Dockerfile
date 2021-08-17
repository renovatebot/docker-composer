
# renovate: datasource=github-releases depName=containerbase/php-prebuild
ARG PHP_VERSION=7.4.22

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.1.5

FROM renovate/buildpack:5-php@sha256:5f659ba90233e257f82372d392ff6fc5a95dbc409e22964968fdf15bc430365c

ARG PHP_VERSION
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
  org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
