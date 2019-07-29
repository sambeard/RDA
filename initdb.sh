#!/usr/bin/bash

# remove db
echo "Removing database if exists"
rm -f rda.db

# create db
echo "Creating new database rda.db"
sqlite3 rda.db <<EOF
.exit
EOF

# fill db
echo "Importing data from data/worldcities.csv"
sqlite3 rda.db <<EOF
.mode csv
.echo ON
.import .\data\worldcities.csv cities
.schema cities
EOF