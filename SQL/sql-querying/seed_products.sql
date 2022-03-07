DROP DATABASE IF EXISTS  products_db;

CREATE DATABASE products_db;

\c products_db

CREATE TABLE products (
  id SERIAL PRIMARY KEY, --SERIAL means it'll auto increment id without needing to manually input them, PRIMARY KEY is unique ID for each row
  name TEXT NOT NULL,    --NOT NULL means you can't leave them blank
  price FLOAT CHECK (price > 0),
  can_be_returned BOOLEAN NOT NULL
);