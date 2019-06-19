FROM renovate/base@sha256:35fba95cd19265a170a8cf80627bde161c7242aed6f314173ebd3777c2ce3d3f

USER root

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y php-cli php-mbstring git unzip && apt-get clean

ENV COMPOSER_VERSION=1.7.2

RUN php -r "copy('https://github.com/composer/composer/releases/download/$COMPOSER_VERSION/composer.phar', '/usr/local/bin/composer');"

RUN chmod +x /usr/local/bin/composer

RUN ls -l /usr/local/bin

USER ubuntu
