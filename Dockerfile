# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=1.10.6

FROM renovate/buildpack:2-php@sha256:8c39500c167bd48fa723f17c9ef10b25e343230358118c8b301bed7e70e57145

# renovate: datasource=docker depName=php versioning=docker
ARG PHP_VERSION=7.4
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
      org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
