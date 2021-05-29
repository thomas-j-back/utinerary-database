#syntax=docker/dockerfile:1
FROM ubuntu 
MAINTAINER thomas.johan.back@gmail.com

RUN apt-get update && apt-get install -y gnupg2

# Add the PostgreSQL PGP key to verify their Debian packages.
# It should be the same key as https://www.postgresql.org/media/keys/ACCC4CF8.asc
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8

# Add PostgreSQL's repository. It contains the most recent stable release
#  of PostgreSQL.
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list


# Install ``python-software-properties``, ``software-properties-common`` and PostgreSQL 9.3
#  There are some warnings (in red) that show up during the build. You can hide
#  them by prefixing each apt-get statement with DEBIAN_FRONTEND=noninteractive
RUN DEBIAN_FRONTEND="noninteractive" apt-get update && apt-get install -y python-software-properties software-properties-common postgresql-9.3 postgresql-client-9.3 postgresql-contrib-9.3

USER postgres

RUN mkdir ~/utin/psql_setup

ADD psql_setup/ ~/utin/psql_setup

RUN psql --command "CREATE USER utin_admin WITH ENCRYPTED PASSWORD 'utin2020';" &&\
    createdb -O utin_admin utinerary


RUN psql --command "CREATE DATABASE utinerary;"
RUN psql --command "CREATE USER utin_admin WITH ENCRYPTED PASSWORD 'utin2020';"
RUN psql --command  "GRANT ALL ON DATABASE utinerary TO utin_admin;"


CMD ["echo","Image created and utin db setup copied over"]