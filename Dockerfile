#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=latest

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.0.8

FROM renovate/buildpack:2-php@sha256:3f83e95c4ed1e3c7d50bb1d9b1dfa1a568df67b2f5dec62a7756e3e0833006de as base-latest
FROM renovate/buildpack:2-php-bionic@sha256:ea5c1e3420c04eee9e875092681137d39023a970d080fd3a118ef6ee4c250725 as base-bionic
FROM renovate/buildpack:2-php-focal@sha256:4c692fde3cb0b8ade90a51963d663e40699138300450c79fa9d97668fa8ee5c8 as base-focal

#--------------------------------------
# Image: final
#--------------------------------------
FROM base-${FLAVOR}

# renovate: datasource=docker depName=php versioning=docker
ARG PHP_VERSION=7.4
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
  org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
