# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=1.10.7

FROM renovate/buildpack:2-php@sha256:82616cd0197b82c03de10bdae80396a5d4715d84a63117cb25c73786cd0665aa

# renovate: datasource=docker depName=php versioning=docker
ARG PHP_VERSION=7.4
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
      org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
