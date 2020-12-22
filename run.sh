#!/bin/bash
set -eux

# Build the database image
docker build -t sqlboiler_bug:latest .

# Run the database
docker run --name sqlboiler_bug --publish 5432:5432 --detach --rm sqlboiler_bug:latest

# Wait for a few seconds for the database to initialize
sleep 10

# Generate models
sqlboiler psql

# Get rid of the database
docker stop sqlboiler_bug

# Attempt to compile the models
go build ./models
