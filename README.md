# utinerary-database

Database setup/configuration for Utinerary application. Setup in postgres.

## Setup without Docker Container

Perform the following steps to setup the Utinerary PSQL Database.

Install Postgresql on a UNIX environment and create users and role configuration as needed

Download this git repository and run the following command

> psql [username] -f createdb.sql

This will execute the database creation. Verify there are no errors

## Setup w/Docker

run the command:

> docker build -t [image_name]:[tag_name] .

In this repository after cloning.

Image and tag name meant to delinate the purpose of container, such as dev or production environments

Once created successfully run command:

> docker run --rm -P --name [container_name] [image_name:tag_name]

This will create a container you can link to
