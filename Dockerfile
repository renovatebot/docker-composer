FROM renovate/buildpack@sha256:c6f6576e75d493c4a1ff50eb620cbd16ac38221f8c705ed5be3144d940e20d72

ARG PHP_VERSION=7.4
RUN install-tool php

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=1.10.5
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
      org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
