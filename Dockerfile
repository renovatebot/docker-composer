#--------------------------------------
# Ubuntu base image to use
#--------------------------------------
ARG FLAVOR=latest

#--------------------------------------
# renovate rebuild triggers
#--------------------------------------

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.0.8

FROM renovate/buildpack:2-php@sha256:ba2f66a1db6d3e065667fb3def3a8c1f95ff9325e8c5eab5e1bbd5ad0aab8798 as base-latest
FROM renovate/buildpack:2-php-bionic@sha256:59505b48206970c7843a416ccb0f1e7afd95891c191f2bef3e98639492220ebf as base-bionic
FROM renovate/buildpack:2-php-focal@sha256:49395631ec3697a3ddd8d4a880a1a8f2de63b35da623026c01e8f1e658631334 as base-focal

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
