#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=latest

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.0.8

FROM renovate/buildpack:2-php@sha256:d42664273eba313d3fa03110e0785655029fa7896a2d189fdcb1c43069b0aa05 as base-latest
FROM renovate/buildpack:2-php-bionic@sha256:ec6ff02592ea9a15b137521532e4f77e0d6e0c1eff5e4cb9fbed0ef8cb5b85ac as base-bionic
FROM renovate/buildpack:2-php-focal@sha256:ff552ad44eed8d54b2a6780d04a8d1a01b0353a38761396f910572760dbe7e59 as base-focal

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
