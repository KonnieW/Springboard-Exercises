-- from the terminal run:
-- psql < outer_space.sql

--original code:
-- CREATE TABLE planets
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   orbital_period_in_years FLOAT NOT NULL,
--   orbits_around TEXT NOT NULL,
--   galaxy TEXT NOT NULL,
--   moons TEXT[]
-- );

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'), --break up the arrays into single data
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');


DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE orbits
(
   id SERIAL PRIMARY KEY,
   name TEXT
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  galaxy TEXT NOT NULL,
  orbits_id INTEGER REFERENCES orbits (id) NOT NULL
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT,
  planets_id INTEGER REFERENCES planets (id)
);

INSERT INTO orbits
  (name)
VALUES
  ('The Sun'), ('Proxima Centauri'), ('Gliese 876');

INSERT INTO planets
  (name, orbital_period_in_years, galaxy, orbits_id)
VALUES
  ('Earth', 1.00, 'Milky Way', 1),
  ('Mars', 1.88, 'Milky Way', 1),
  ('Venus', 0.62,'Milky Way', 1),
  ('Neptune', 164.8, 'Milky Way', 1),
  ('Proxima Centauri b', 0.03, 'Milky Way', 2),
  ('Gliese 876 b', 0.23, 'Milky Way', 3);

INSERT INTO moons
  (name, planets_id)
VALUES  
  ('The Moon', 1), ('Phobos', 2), ('Deimos', 2), ('Naiad', 4), ('Thalassa', 4), ('Despina', 4), ('Galatea', 4), ('Larissa', 4), ('S/2004 N 1', 4), 
  ('Proteus', 4), ('Triton', 4), ('Nereid', 4), ('Halimede', 4), ('Sao', 4), ('Laomedeia', 4), ('Psamathe', 4), ('Neso' , 4); 