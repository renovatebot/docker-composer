FROM renovate/base@sha256:0a284bd3fe8dbd7dffdd2d2adac5135686b13a15757e11375a4c2742b9be5137

USER root

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y php-cli php-mbstring git unzip && apt-get clean

ENV COMPOSER_VERSION=1.7.2

RUN php -r "copy('https://github.com/composer/composer/releases/download/$COMPOSER_VERSION/composer.phar', '/usr/local/bin/composer');"

RUN chmod +x /usr/local/bin/composer

RUN ls -l /usr/local/bin

USER ubuntu
