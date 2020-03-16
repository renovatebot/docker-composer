FROM renovate/base@sha256:db3e68b80043f9cb6227eb46053e2475a318b26bebbdfaecef69011c2291aabc

USER root

RUN echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu bionic main" > /etc/apt/sources.list.d/ondrej-php.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 14AA40EC0831756756D7F66C4F4EA0AAE5267A6C && \
    apt-get update && \
    apt-get -y install php7.4-cli php7.4-mbstring && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y php-cli php-mbstring git unzip && apt-get clean

# renovate: github-releases/composer/composer
ENV COMPOSER_VERSION=1.10.1

RUN php -r "copy('https://github.com/composer/composer/releases/download/$COMPOSER_VERSION/composer.phar', '/usr/local/bin/composer');"

RUN chmod +x /usr/local/bin/composer

RUN ls -l /usr/local/bin

USER 1000
