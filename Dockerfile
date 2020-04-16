FROM renovate/buildpack@sha256:f578b330f5f5c65d63de1d09d2e22f4a8cdaff18e91fe76e8fe89c4ed70f0a32

# renovate: datasource=github-releases depName=composer/composer
ENV COMPOSER_VERSION=1.10.5

RUN /usr/local/build/composer.sh

USER 1000
