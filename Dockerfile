FROM renovate/base@sha256:db3e68b80043f9cb6227eb46053e2475a318b26bebbdfaecef69011c2291aabc

USER root

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y php-cli php-mbstring git unzip && apt-get clean

# github-releases/composer/composer
ENV COMPOSER_VERSION=1.9.3

RUN php -r "copy('https://github.com/composer/composer/releases/download/$COMPOSER_VERSION/composer.phar', '/usr/local/bin/composer');"

RUN chmod +x /usr/local/bin/composer

RUN ls -l /usr/local/bin

USER ubuntu
