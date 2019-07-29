#!/usr/bin/bash

MODELS = "$PWD/src/sql/models.sql"
DATA = "$PWD/data/worldcities.csv"



# remove db
echo "Removing database if exists"
rm -f rda.db

# create db
echo "Creating new database rda.db"
sqlite3 rda.db <<EOF
.output stdout
.log stderr
.print "importing models from $MODELS"
.read $MODELS
.print "Importing data from $DATA
.mode csv
.import $DATA cities
EOF
