#!/bin/bash

echo "Setting Laravel public as root..."

cd /home/site/wwwroot

# permissions
chmod -R 775 storage bootstrap/cache

# optimize
php artisan config:cache
php artisan route:cache
php artisan view:cache

# start php-fpm
php-fpm
