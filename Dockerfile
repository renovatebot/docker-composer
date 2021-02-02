#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=latest

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.0.9

FROM renovate/buildpack:3-php@sha256:e95a46f112917d853a99acfb33a82583fa90f8a1af0cf727992ee7c91c40ddff as base-latest
FROM renovate/buildpack:3-php-bionic@sha256:8fcb93ca9080805e842bd9b714567846e6f5cc3914410810b7df7a7bf8f49431 as base-bionic
FROM renovate/buildpack:3-php-focal@sha256:9d68a9d9168391a08a9bc49869e6cdffdc2766b63f73b5b60b6c13735db6c916 as base-focal

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
