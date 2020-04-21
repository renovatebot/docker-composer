FROM renovate/buildpack@sha256:aa28e984ed1a4cae5c2bb051e341637020951de5c199ff6de851a3f090cdb020

ARG PHP_VERSION=7.4
RUN install-tool php

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=1.10.5
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
      org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
