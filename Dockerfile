FROM mysql:latest

ADD ./tables /docker-entrypoint-initdb.d
ADD ./scripts /docker-entrypoint-initdb.d