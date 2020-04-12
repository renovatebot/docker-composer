FROM renovate/buildpack

# renovate: datasource=github-releases depName=composer/composer
ENV COMPOSER_VERSION=1.10.4

RUN /usr/local/bin/build/composer.sh

USER 1000