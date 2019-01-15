FROM php:7.2-fpm

EXPOSE 9000

RUN apt-get update \
    && apt-get install -y libssh2-1-dev libssh2-1 \
    && rm -rf /var/lib/apt/lists/* \
    && pecl install ssh2-1.1.2 \
    && docker-php-ext-enable ssh2 \
    && apt-get update \
    && apt-get install -y libfreetype6-dev libmcrypt-dev \
    && apt-get install -y zip unzip mysql-client \
    && apt-get install -y libmcrypt-dev \
    && pecl install mcrypt-1.0.1 \
    && docker-php-ext-enable mcrypt \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN docker-php-ext-install -j$(nproc) mysqli \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install zip

RUN curl --silent --show-error https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

RUN apt-get update && apt-get install -my wget gnupg

################################################
# Add Xdebuger
################################################
RUN echo 'xdebug.remote_enable=1' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo 'xdebug.remote_port=9000' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo 'xdebug.remote_autostart=1' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo 'xdebug.remote_connect_back=1' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN echo 'xdebug.remote_host=qxc_php' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

#################################################
# Add your user with sudo privileges on container
#################################################
ARG USER_NAME="root"
ARG UID=0

RUN if [ ${UID} > 0 ] ; then \
     apt-get update; \
     apt-get -y install sudo && \
     groupadd -g ${UID} ${USER_NAME} && \
     useradd -r -m -u ${UID} -g ${USER_NAME} ${USER_NAME} && echo "${USER_NAME}:${USER_NAME}" | chpasswd && adduser ${USER_NAME} sudo \
;fi

USER ${USER_NAME}
