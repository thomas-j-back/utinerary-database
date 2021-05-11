BEGIN;

CREATE DATABASE utinerary;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE app_user (
     user_id uuid DEFAULT uuid_generate_v4 () NOT NULL,
     first_name VARCHAR(100) NOT NULL,
     last_name  VARCHAR(100) NOT NULL,
     email      VARCHAR(100) NOT NULL,
     PRIMARY KEY(user_id)

);

CREATE TABLE event (
     event_id uuid DEFAULT uuid_generate_v4() NOT NULL,
     user_id uuid,
     title VARCHAR(100) NOT NULL,
     description VARCHAR(1000),
     from_date TIMESTAMPTZ,
     to_date TIMESTAMPTZ,
     status  SMALLINT NOT NULL,
     PRIMARY KEY(event_id),
     CONSTRAINT fk_app_user 
	FOREIGN KEY(user_id)
		REFERENCES(app_user)

);

CREATE TABLE m2m_event_user (
     id uuid DEFAULT uuid_generate_V4() NOT NULL,
     event_id uuid,
     app_user_id uuid,
     PRIMARY KEY(id),
     CONSTRAINT fk_event
	FOREIGN KEY(event_id)
		REFERENCES(event)
     CONSTRAINT fk_app_user
	FOREIGN KEY(app_user_id)
		REFERENCES(app_user)
);


