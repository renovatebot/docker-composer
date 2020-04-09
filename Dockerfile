FROM renovate/base@sha256:d694b03ba0df63ac9b27445e76657d4ed62898d721b997372aab150ee84e07a1

USER root

RUN echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu bionic main" > /etc/apt/sources.list.d/ondrej-php.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 14AA40EC0831756756D7F66C4F4EA0AAE5267A6C && \
    apt-get update && \
    apt-get -y install php7.4-cli php7.4-mbstring php7.4-curl && \
    rm -rf /var/lib/apt/lists/*

# renovate: datasource=github-releases depName=composer/composer
ENV COMPOSER_VERSION=1.10.1

RUN curl https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer | php -- --version=$COMPOSER_VERSION --install-dir=/usr/local/bin --filename=composer

RUN composer --version

USER 1000
