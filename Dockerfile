#syntax=docker/dockerfile:1
FROM ubuntu 
MAINTAINER thomas.johan.back@gmail.com
RUN sudo apt-get update
RUN sudo apt install postgresql postgresql-contrib
RUN mkdir ~/utin/psql_setup
ADD psql_setup ~/utin/psql_setup
