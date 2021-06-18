
# renovate: datasource=github-releases depName=containerbase/php-prebuild
ARG PHP_VERSION=7.4.20

# renovate: datasource=github-releases depName=composer/composer
ARG COMPOSER_VERSION=2.1.3

FROM renovate/buildpack:5-php@sha256:a603bfe21858d060dc92533278f080b6debebfe4a74fe0657b512b713f4f7e96

ARG PHP_VERSION
RUN install-tool php

ARG COMPOSER_VERSION
RUN install-tool composer

LABEL org.opencontainers.image.source="https://github.com/renovatebot/docker-composer" \
  org.opencontainers.image.version="${COMPOSER_VERSION}"

USER 1000
