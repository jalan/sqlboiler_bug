FROM postgres:13.1

ENV POSTGRES_HOST_AUTH_METHOD=trust
COPY create_db.sh /docker-entrypoint-initdb.d/create_db.sh
