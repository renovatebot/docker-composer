# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=1.10.5

FROM renovate/buildpack:2-php@sha256:59ee6c1f9b32f2984a6fee6434e7a23cdb96a034feae3662b85b8766a852604c

# renovate: datasource=docker depName=php versioning=docker
ARG PHP_VERSION=7.4
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
      org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
