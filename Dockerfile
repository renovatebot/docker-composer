# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=1.10.5

FROM renovate/buildpack:2-php@sha256:417c09c0e7570f05447454503e28f22c36dcfb36c2395193a12400e4336aa5ae

# renovate: datasource=docker depName=php versioning=docker
ARG PHP_VERSION=7.4
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
      org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
