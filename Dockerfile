#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=latest

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.0.9

FROM renovate/buildpack:2-php@sha256:cf330bdd3c434868af4d8c82f48a6a6a406e798fbfbb2112dea233093353e0e6 as base-latest
FROM renovate/buildpack:2-php-bionic@sha256:7c93a374facfd71496c96cf40b8f855c9f8447ff1a89515585369c7fe10ce8d1 as base-bionic
FROM renovate/buildpack:2-php-focal@sha256:15e9a4086efb3a688187a748e7f61ffa3e514c2b0341efa7d602a4852048815a as base-focal

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
