
# renovate: datasource=github-releases depName=containerbase/php-prebuild
ARG PHP_VERSION=7.4.21

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.1.3

FROM renovate/buildpack:5-php@sha256:5a393d1aefd62116228d510d0c1e7a12a730f3ba77084c754d23de7fa1cefa93

ARG PHP_VERSION
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
  org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
