#! /bin/sh

# Load settings from env var
TEMPLATE_DB_HOST="${DB_HOST:-localhost}"
TEMPLATE_DB_USER="${DB_USER:-admin}"
TEMPLATE_DB_PASSWORD="${DB_PASSWORD:-rootpassword123}"
TEMPLATE_DB_PORT="${DB_PORT:-3306}"
TEMPLATE_DB_DATABASE="${DB_DATABASE:-test}"

# Inline replace config.js
sed -i "s/TEMPLATE_DB_HOST/$TEMPLATE_DB_HOST/g" config.js
sed -i "s/TEMPLATE_DB_USER/$TEMPLATE_DB_USER/g" config.js
sed -i "s/TEMPLATE_DB_PASSWORD/$TEMPLATE_DB_PASSWORD/g" config.js
sed -i "s/TEMPLATE_DB_PORT/$TEMPLATE_DB_PORT/g" config.js
sed -i "s/TEMPLATE_DB_DATABASE/$TEMPLATE_DB_DATABASE/g" config.js

# Run the app
node app.js
