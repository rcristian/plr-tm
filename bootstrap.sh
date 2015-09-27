#!/usr/bin/env bash

apt-get update
apt-get install -y postgresql-9.4-plr

echo "install.packages(c('tm'), dependencies=TRUE, repos='http://cran.rstudio.com/')" > setup-tm.R 
R CMD BATCH setup-tm.R

PG_VERSION="9.4"

PG_CONF="/etc/postgresql/$PG_VERSION/main/postgresql.conf"
PG_HBA="/etc/postgresql/$PG_VERSION/main/pg_hba.conf"
PG_DIR="/var/lib/postgresql/$PG_VERSION/main"

# Edit postgresql.conf to change listen address to '*':
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" "$PG_CONF"

# Append to pg_hba.conf to add password auth:
echo "host    all             all             all                     md5" >> "$PG_HBA"

# Explicitly set default client_encoding
echo "client_encoding = utf8" >> "$PG_CONF"

# Restart so that all new config is loaded:
service postgresql restart


echo "ALTER USER postgres WITH PASSWORD 'postgres' ;" | su - postgres -c "psql -U postgres -d postgres"
su - postgres -c "pg_restore -C -d postgres /home/vagrant/kmeans.backup"






