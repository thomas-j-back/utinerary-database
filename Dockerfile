#syntax=docker/dockerfile:1
FROM ubuntu 
MAINTAINER thomas.johan.back@gmail.com
RUN apt-get update
RUN apt install postgresql postgresql-contrib
RUN mkdir ~/utin/psql_setup
ADD psql_setup/ ~/utin/psql_setup
CMD ["echo","Image created and utin db setup copied over"]