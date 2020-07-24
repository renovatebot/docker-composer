# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=1.10.9

FROM renovate/buildpack:2-php@sha256:ad37ba8bebece9d6e91032f2b6ffdfa14e6a2bb82c7f74e7b3931d183b09ffb1

# renovate: datasource=docker depName=php versioning=docker
ARG PHP_VERSION=7.4
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
      org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
