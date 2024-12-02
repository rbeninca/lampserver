# Dockerfile
FROM httpd:latest

# Copiar arquivos de configuração personalizados para o container
COPY httpd.conf /usr/local/apache2/conf/httpd.conf



FROM php:8.0-apache

# Instalar a extensão PDO MySQL
RUN docker-php-ext-install pdo pdo_mysql

# Copiar a configuração do Apache
COPY ./httpd.conf /etc/apache2/sites-available/000-default.conf

# Habilitar os módulos do Apache, se necessário
RUN a2enmod rewrite