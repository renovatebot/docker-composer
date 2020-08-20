# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=1.10.10

FROM renovate/buildpack:2-php@sha256:c072bf7ed598285a0451d0a58ed2805171bfc1e4fcaa730246288ccaf3ea03ec

# renovate: datasource=docker depName=php versioning=docker
ARG PHP_VERSION=7.4
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
      org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
