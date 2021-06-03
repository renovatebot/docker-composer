
# renovate: datasource=github-releases depName=containerbase/php-prebuild
ARG PHP_VERSION=7.4.19

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.1.0

FROM renovate/buildpack:5-php@sha256:be47088f97fd12f4814d4a4142683cd9a5e6dc80aafb994a65914446f72a4437

ARG PHP_VERSION
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
  org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
