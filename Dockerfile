#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=latest

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.0.9

FROM renovate/buildpack:3-php@sha256:5b5eb4591483642a2968babb8931c7869b4359cf9d676ec0b8022d01805d6a8e as base-latest
FROM renovate/buildpack:3-php-bionic@sha256:195aadac2ed16066dd9cbfaf5fb9ef67dc5b5638412b41f2c223f60c092302d0 as base-bionic
FROM renovate/buildpack:3-php-focal@sha256:1c97992205ba39e89a75c7db233640f1456e34bc5f8b81165fc8be1a55bfa563 as base-focal

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
