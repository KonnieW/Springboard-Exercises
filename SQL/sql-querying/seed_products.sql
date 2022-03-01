DROP DATABASE IF EXISTS  products_db;

CREATE DATABASE products_db;

\c products_db

CREATE TABLE products (
  id SERIAL PRIMARY KEY, --SERIAL means it'll auto increment id without me needing to manually input them
  name TEXT NOT NULL,    --NOT NULL means you can't leave them blank
  price FLOAT CHECK (price > 0),
  can_be_returned BOOLEAN NOT NULL
);

--is there a way for the psql terminal to automatically read the data in this file?
--or do I need to manually input it?
-- INSERT INTO products 
--   (name, price, can_be_returned)
-- VALUES 
--   ('cheese', 5.00, 'f'); 


-- To start up terminal type in psql
-- \l to see what tables there are
-- \c _dbname_ to connect to specific ones
-- SELECT * FROM _nameoftable_; to get data
-- \q to exit and return to main terminal page