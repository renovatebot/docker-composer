FROM renovate/buildpack@sha256:1778d9326950d56e676e52770904b91ee966f39457604f3e822eac1be5597882

ARG PHP_VERSION=7.4
RUN install-tool php

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=1.10.5
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
      org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
