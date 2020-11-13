# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.0.7

FROM renovate/buildpack:2-php@sha256:9e7b1f67a16fa6ac31649b0610e8d28385cae197f72b454867f5251e3714a662

# renovate: datasource=docker depName=php versioning=docker
ARG PHP_VERSION=7.4
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
      org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
