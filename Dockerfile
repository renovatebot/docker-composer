#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=latest

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.0.9

FROM renovate/buildpack:3-php@sha256:a53abf34a8a5eb0c54faea933b576c3143feeada5dbc7e98e0d08f2b2a60f580 as base-latest
FROM renovate/buildpack:3-php-bionic@sha256:e8a09b00335f0f5d5fce375ba7fa731501d5d6b4f173fc9e3e26ef9bc31fc7db as base-bionic
FROM renovate/buildpack:3-php-focal@sha256:74c58545fe011de927aa83e24432c25da8c74772fb6e8badbb5909d9c77da434 as base-focal

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
