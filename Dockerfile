FROM renovate/buildpack@sha256:9791914dbbfa58d163dbe36d304ec92462a2816f042d73ecbee9bf7c34d63d71

# renovate: datasource=github-releases depName=composer/composer
ENV COMPOSER_VERSION=1.10.4

RUN /usr/local/bin/build/composer.sh

USER 1000
