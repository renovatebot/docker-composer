# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=1.10.8

FROM renovate/buildpack:2-php@sha256:809f018eead993a366228efa168263cf76873f13b9322a27a5e8a43a7d819d8e

# renovate: datasource=docker depName=php versioning=docker
ARG PHP_VERSION=7.4
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
      org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
