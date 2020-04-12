FROM renovate/buildpack@sha256:f8dcdf94d683cbeec33337c1787bbbdf7e0205269efb3a68df1b091a6c7c5710

# renovate: datasource=github-releases depName=composer/composer
ENV COMPOSER_VERSION=1.10.5

RUN /usr/local/build/composer.sh

USER 1000
