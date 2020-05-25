# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=1.10.6

FROM renovate/buildpack:2-php@sha256:10d85d152238e66dfc826dae746466044229c7f522aa332724a29c092467ec15

# renovate: datasource=docker depName=php versioning=docker
ARG PHP_VERSION=7.4
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
      org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
