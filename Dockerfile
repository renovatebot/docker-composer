FROM renovate/base@sha256:3bd934a4709db3b91e32f005c6783b5407b2fac28be08da6b5c6cf91e4b2ec60

USER root

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y php-cli php-mbstring git unzip && apt-get clean

ENV COMPOSER_VERSION=1.7.2

RUN php -r "copy('https://github.com/composer/composer/releases/download/$COMPOSER_VERSION/composer.phar', '/usr/local/bin/composer');"

RUN chmod +x /usr/local/bin/composer

RUN ls -l /usr/local/bin

USER ubuntu
