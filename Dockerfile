
# renovate: datasource=docker depName=php versioning=docker
ARG PHP_VERSION=7.4

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.0.11

FROM renovate/buildpack:4-php@sha256:4d674227471590e7f8062530b3da940ac795e771e07baccc54cad4c7a5526c0a

ARG PHP_VERSION
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
  org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
