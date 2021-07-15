
# renovate: datasource=github-releases depName=containerbase/php-prebuild
ARG PHP_VERSION=7.4.21

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.1.3

FROM renovate/buildpack:5-php@sha256:00e129ffaddafe6952686b2823a8378ff24df5dca4ecd7678792b7e6ef451c11

ARG PHP_VERSION
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
  org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
