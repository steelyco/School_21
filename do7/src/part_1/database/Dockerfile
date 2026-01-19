FROM postgres:18-alpine3.22
WORKDIR /postgresql
COPY init.sql /docker-entrypoint-initdb.d/
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
