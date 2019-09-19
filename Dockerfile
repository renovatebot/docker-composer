FROM renovate/base@sha256:46ea1196178f0bc0a3c54e2d7ee701ab7169605788b2d7f07ff4f7267670bc45

USER root

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y php-cli php-mbstring git unzip && apt-get clean

ENV COMPOSER_VERSION=1.7.2

RUN php -r "copy('https://github.com/composer/composer/releases/download/$COMPOSER_VERSION/composer.phar', '/usr/local/bin/composer');"

RUN chmod +x /usr/local/bin/composer

RUN ls -l /usr/local/bin

USER ubuntu
