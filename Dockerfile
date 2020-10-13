# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=1.10.14

FROM renovate/buildpack:2-php@sha256:898a53d60992db3b8a95395a92586cae4d5ad4f4db0e3bec63a319df8da45974

# renovate: datasource=docker depName=php versioning=docker
ARG PHP_VERSION=7.4
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
      org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
