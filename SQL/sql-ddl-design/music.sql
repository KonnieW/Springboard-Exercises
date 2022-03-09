-- from the terminal run:
-- psql < music.sql

-- original code:
-- CREATE TABLE songs
-- (
--   id SERIAL PRIMARY KEY,
--   title TEXT NOT NULL,
--   duration_in_seconds INTEGER NOT NULL,
--   release_date DATE NOT NULL,
--   artists TEXT[] NOT NULL,
--   album TEXT NOT NULL,
--   producers TEXT[] NOT NULL
-- );

-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}');


DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music


CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artists_name TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producers_name TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  album TEXT NOT NULL
  -- artist_id INTEGER REFERENCES artists (id),
  -- producer_id INTEGER REFERENCES producers (id)
);


INSERT INTO songs
  (title, duration_in_seconds, release_date, album) -- artist_id, producer_id
VALUES
  -- ('MMMBop', 238, '04-15-1997', 'Middle of Nowhere', 1, (1, 2)),       --ASK GEORGE ABOUT THIS PRODUCER/ARTIST MUTIPLE ID ISSUE and if this works how do you access it in the terminal
  -- ('Bohemian Rhapsody', 355, '10-31-1975', 'A Night at the Opera', 1, 3),
  -- ('One Sweet Day', 282, '11-14-1995', 'Daydream', (3,4), 4),
  -- ('Shallow', 216, '09-27-2018', 'A Star Is Born', (5,6), 5),
  -- ('How You Remind Me', 223, '08-21-2001', 'Silver Side Up', 7, 6),
  -- ('New York State of Mind', 276, '10-20-2009', 'The Blueprint 3', (8,9), 7),
  -- ('Dark Horse', 215, '12-17-2013',  'Prism', (10,11), (8,9)),
  -- ('Moves Like Jagger', 201, '06-21-2011', 'Hands All Over', (12,13), (10,11)),
  -- ('Complicated', 244, '05-14-2002', 'Let Go', 14, 12),
  -- ('Say My Name', 240, '11-07-1999', "The Writing's on the Wall", 15, 13);

  ('MMMBop', 238, '04-15-1997', 'Middle of Nowhere'), 
  ('Bohemian Rhapsody', 355, '10-31-1975', 'A Night at the Opera'),
  ('One Sweet Day', 282, '11-14-1995', 'Daydream'),
  ('Shallow', 216, '09-27-2018', 'A Star Is Born'),
  ('How You Remind Me', 223, '08-21-2001', 'Silver Side Up'),
  ('New York State of Mind', 276, '10-20-2009', 'The Blueprint 3'),
  ('Dark Horse', 215, '12-17-2013',  'Prism'),
  ('Moves Like Jagger', 201, '06-21-2011', 'Hands All Over'),
  ('Complicated', 244, '05-14-2002', 'Let Go'),
  ('Say My Name', 240, '11-07-1999', 'The Writing"s on the Wall');



INSERT INTO artists
  (artists_name)
VALUES
  -- ('{"Hanson"}', '{"Queen"}', '{"Mariah Cary" , "Boyz II Men"}', '{"Lady Gaga" ,"Bradley Cooper"}',
  -- '{"Nickelback"}', '{"Jay Z" ,"Alicia Keys"}', '{"Katy Perry" ,"Juicy J"}', '{"Maroon 5" , Christina Aguilera"}',
  -- '{"Avril Lavigne"}', '{"Destiny''s Child"}');
  ('Hanson'), ('Queen'), ('Mariah Cary'), ('Boyz II Men'), ('Lady Gaga'), ('Bradley Cooper'),
  ('Nickelback'), ('Jay Z'), ('Alicia Keys'), ('Katy Perry'), ('Juicy J'), ('Maroon 5'), ('Christina Aguilera'),
   ('Avril Lavigne'), ('Destiny''s Child');

INSERT INTO producers
  (producers_name)
VALUES
  -- ('{"Dust Brothers", "Stephen Lironi"}' , '{"Roy Thomas Baker"}','{"Walter Afanasieff"}', '{"Benjamin Rice"}',
  -- '{"Rick Parashar"}', , '{"Al Shux"}', , '{"Max Martin", "Cirkut"}', '{"Shellback", "Benny Blanco"}', '{"The Matrix"}', 
  -- '{"Darkchild"}');
('Dust Brothers'), ('Stephen Lironi') , ('Roy Thomas Baker'),('Walter Afanasieff'), ('Benjamin Rice'),
  ('Rick Parashar'), ('Al Shux'), ('Max Martin'), ('Cirkut'), ('Shellback'), ('Benny Blanco'), ('The Matrix'), 
  ('Darkchild');

  --not sure what to put inside the values as there are multiple artists/producers on certain songs