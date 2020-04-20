FROM renovate/buildpack@sha256:7e28ef186596dc293af15d6c63febf1e424c3e832702864944b498b3050cac52

ARG PHP_VERSION=7.4
RUN install-tool php

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=1.10.5
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
      org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
