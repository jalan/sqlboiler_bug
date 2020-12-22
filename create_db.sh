#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER sqlboiler_bug;
	CREATE DATABASE sqlboiler_bug;
	GRANT ALL PRIVILEGES ON DATABASE sqlboiler_bug TO sqlboiler_bug;
	\c sqlboiler_bug
	CREATE TABLE gpu (
		gpu_id serial PRIMARY KEY
	);
	CREATE TABLE gpu_thing (
		gpu_thing_id serial PRIMARY KEY,
		gpu_id integer REFERENCES gpu (gpu_id)
	);
EOSQL
