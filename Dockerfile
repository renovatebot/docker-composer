
# renovate: datasource=github-releases depName=containerbase/php-prebuild
ARG PHP_VERSION=7.4.22

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.1.5

FROM renovate/buildpack:5-php@sha256:c4d8b06c2fd46273753c7d23fb79bab67247f25e6e821d51ae733793145cbad7

ARG PHP_VERSION
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
  org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
