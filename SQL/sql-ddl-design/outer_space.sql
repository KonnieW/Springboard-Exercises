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

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy TEXT NOT NULL,
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  moons_name TEXT
);


CREATE TABLE planet_moons         --another table and planet orbits
(
  id SERIAL PRIMARY KEY,
  planets_id INTEGER REFERENCES planets (id),
  moon_id INTEGER REFERENCES moons(id),
);

INSERT INTO planets
  (name, orbital_period_in_years, galaxys)
VALUES
  ('Earth', 1.00, 'Milky Way'),
  ('Mars', 1.88, 'Milky Way'),
  ('Venus', 0.62,'Milky Way'),
  ('Neptune', 164.8, 'Milky Way'),
  ('Proxima Centauri b', 0.03, 'Milky Way'),
  ('Gliese 876 b', 0.23, 'Milky Way');

INSERT INTO moon
  (moon_name)
VALUES  
  ('{"The Moon"}', '{"Phobos", "Deimos"}', '{}', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", 
  "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}', '{}', '{}');

  ('{"The Moon"}', '{"Phobos"}', '{"Deimos"}', '{}', '{"Naiad"}', '{"Thalassa"}', '{"Despina"}', '{"Galatea"}', '{"Larissa"}', '{"S/2004 N 1"}', 
  '{"Proteus"}', '{"Triton"}', '{"Nereid"}', '{"Halimede"}', '{"Sao"}', '{"Laomedeia"}', '{"Psamathe"}', '{"Neso"}');


INSERT INTO orbit
  (orbits_around)
VALUES
  ('The Sun', 'Proxima Centauri', 'Gliese 876');


INSERT INTO planet_moon
  (planets_id, moon_id)
VALUES
(
  (1,1), (2,2), (2,3), 
  
  );

  --no moons leave it out completely