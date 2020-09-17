# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=1.10.13

FROM renovate/buildpack:2-php@sha256:2cc66d90e7299b654e36676edb0dd28aeee4f7967362b270a27695f1cdd164c7

# renovate: datasource=docker depName=php versioning=docker
ARG PHP_VERSION=7.4
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
      org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
