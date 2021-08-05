
# renovate: datasource=github-releases depName=containerbase/php-prebuild
ARG PHP_VERSION=7.4.22

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.1.5

FROM renovate/buildpack:5-php@sha256:e0e7eaf0612d435784a0ea7835a3edb73fcc6d7bc48df09afc984c00fc02c699

ARG PHP_VERSION
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
  org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
