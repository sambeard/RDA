#!/usr/bin/bash

models=src/sql/models.sql
data=data/worldcities.csv

# remove db
echo "Removing database if exists"
rm -f rda.db

# create db
echo "Creating new database rda.db"
sqlite3 rda.db <<EOF
.output stdout
.log stderr
.print "importing models from $models"
.read $models
.print "Importing data from $data
.mode csv
.import $data cities
.exit
EOF
