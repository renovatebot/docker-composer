# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=1.10.9

FROM renovate/buildpack:2-php@sha256:a205dc872941ecefc42f9b239122b8a5f30c24965c0e92960bf6f02fddc954c0

# renovate: datasource=docker depName=php versioning=docker
ARG PHP_VERSION=7.4
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
      org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
