#!/usr/bin/env bash

apt-get update
apt-get install -y postgresql-9.4-plr

echo "install.packages(c('tm'), dependencies=TRUE, repos='http://cran.rstudio.com/')" > setup-tm.R 
R CMD BATCH setup-tm.R

echo "ALTER USER postgres WITH PASSWORD 'postgres' ;" | su - postgres -c "psql -U postgres -d postgres"
su - postgres -c "pg_restore -C -d postgres /home/vagrant/kmeans.backup"






