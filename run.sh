#!/bin/sh

# Load environment variables from .env.production
set -o allexport
source .env.production
set +o allexport

# Check if the database file exists and is not empty
if [ ! -s $DB_DATABASE ]
then
    touch $DB_DATABASE
    php artisan migrate:fresh --seed --force
fi

php artisan serve --host=0.0.0.0 --port=8000 --env=production