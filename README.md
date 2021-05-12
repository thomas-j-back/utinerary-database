# utinerary-database
Database setup/configuration for Utinerary application. Setup in postgres.

## Setup
Perform the following steps to setup the Utinerary PSQL Database.

Install Postgresql on a UNIX environment and create users and role configuration as needed

Download this git repository and run the following command

> psql [username] -f createdb.sql

This will execute the database creation. Verify there are no errors 
