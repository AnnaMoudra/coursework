#!/bin/bash

# https://stackoverflow.com/questions/22903876/uploading-sql-ddl-file-to-postgresql-database

sudo -u postgres createdb stage 2>/dev/null
sudo -u postgres createdb target 2>/dev/null

sudo -u postgres psql -v ON_ERROR_STOP=1 -1 -d stage < stage.sql
sudo -u postgres psql -v ON_ERROR_STOP=1 -1 -d target < target.sql