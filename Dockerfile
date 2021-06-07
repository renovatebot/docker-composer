
# renovate: datasource=github-releases depName=containerbase/php-prebuild
ARG PHP_VERSION=7.4.20

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.1.2

FROM renovate/buildpack:5-php@sha256:375d3c6a9bc713128e35000b97de3493066e84f88b95a494f559350854456d57

ARG PHP_VERSION
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
  org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
