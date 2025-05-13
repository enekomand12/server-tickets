# Usa una imagen base de PHP con Apache
FROM php:8.1-apache

# Copia los archivos del proyecto al contenedor
COPY . /var/www/html

# Establece permisos adecuados
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Instala extensiones necesarias (ajusta según tus necesidades)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Expone el puerto 80 para Apache
EXPOSE 80

# Inicia el servidor Apache
CMD ["apache2-foreground"]