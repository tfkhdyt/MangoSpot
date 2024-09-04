FROM php:apache-bookworm
WORKDIR /var/www/html/mangospot
COPY . .
RUN a2enmod rewrite
RUN apt update && apt install -y libmcrypt-dev libssh2-1-dev libzip-dev
RUN pecl install mcrypt-1.0.7 ssh2-1.4.1 zip-1.22.3
# RUN docker-php-ext-install gd curl xml xsl  
RUN docker-php-ext-enable mcrypt ssh2 zip

# RUN a2enmod php rewrite htaccess php-mcrypt php-ssh2 php-gd php-curl php-xml php-xsl php-zip
# CMD [ "/etc/init.d/apache2", "restart" ]