# Dockerfile
FROM httpd:latest

# Copiar arquivos de configuração personalizados para o container
COPY httpd.conf /usr/local/apache2/conf/httpd.conf
