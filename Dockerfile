# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=1.10.16

FROM renovate/buildpack:2-php@sha256:c07b7ae6b88de3a84807b12428378af1e4ade440e3a9be309d7a27d12e03e668

# renovate: datasource=docker depName=php versioning=docker
ARG PHP_VERSION=7.4
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
      org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
