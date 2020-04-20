FROM renovate/buildpack@sha256:1b937dcd416efb84b7be53b050d883bcfdf2f925ab81fd38211f0d75cb235186

# renovate: datasource=github-releases depName=composer/composer
ENV COMPOSER_VERSION=1.10.5

RUN /usr/local/build/composer.sh

USER 1000
