
# renovate: datasource=github-releases depName=containerbase/php-prebuild
ARG PHP_VERSION=7.4.21

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.1.3

FROM renovate/buildpack:5-php@sha256:c02a704b88f795501f624d0369394d8fa9b14aa7e91c348fc697411bdd715b52

ARG PHP_VERSION
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
  org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
