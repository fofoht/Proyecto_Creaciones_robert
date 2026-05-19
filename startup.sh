#!/bin/bash

echo "Starting Laravel App on Azure..."

cd /home/site/wwwroot

# permisos críticos
chmod -R 775 storage bootstrap/cache

# limpiar caches (más seguro en deploy)
php artisan config:clear
php artisan route:clear
php artisan view:clear

# volver a generar optimizado
php artisan config:cache
php artisan route:cache
php artisan view:cache

echo "Starting PHP-FPM..."
exec php-fpm
