
# renovate: datasource=github-releases depName=containerbase/php-prebuild
ARG PHP_VERSION=7.4.22

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.1.5

FROM renovate/buildpack:5-php@sha256:7acd1bd82e962105c70c456c9932589d0fc6e468ea6af16ee412e4c158398081

ARG PHP_VERSION
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
  org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
