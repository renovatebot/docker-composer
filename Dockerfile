
# renovate: datasource=github-releases depName=containerbase/php-prebuild
ARG PHP_VERSION=7.4.19

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.0.13

FROM renovate/buildpack:5-php@sha256:d883fd4c7949be0d9b1c7937c7a3269f2229ccdb39b876bc00ecd9c88140046d

ARG PHP_VERSION
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
  org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
