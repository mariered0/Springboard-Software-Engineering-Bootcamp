-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artist1 INTEGER REFERENCES artists ON DELETE SET NULL,
  artist2 INTEGER REFERENCES artists ON DELETE SET NULL,
  album_id INTEGER REFERENCES albums ON DELETE SET NULL,
  producer1 INTEGER REFERENCES producers ON DELETE SET NULL,
  producer2 INTEGER REFERENCES producers ON DELETE SET NULL
);

INSERT INTO producers
(name)
VALUES
('Dust Brothers'),
('Stephen Lironi'),
('Roy Thomas Baker'),
('Walter Afanasieff'),
('Benjamin Rice'),
('Rick Parashar'),
('Al Shux'),
('Max Martin'),
('Cirkut'),
('Shellback'),
('Benny Blanco'),
('The Matrix'),
('Darkchild');

INSERT INTO artists
(name)
VALUES
('Hanson'),
('Queen'),
('Mariah Cary'),
('Boyz II Men'),
('Lady Gaga'),
('Bradley Cooper'),
('Nickelback'),
('Jay Z'),
('Alicia Keys'),
('Katy Perry'),
('Juicy J'),
('Maroon 5'),
('Christina Aguilera'),
('Avril Lavigne'),
('Destiny''s Child');

INSERT INTO albums
  (title)
VALUES
 ('Middle of Nowhere'),
 ('A Night at the Opera'),
 ('Daydream'),
 ('A Star Is Born'),
 ('Silver Side Up'),
 ('The Blueprint 3'),
 ('Prism'),
 ('Hands All Over'),
 ('Let Go'),
 ('The Writing''s on the Wall');

INSERT INTO songs
  (title, duration_in_seconds, release_date, artist1, album_id, producer1)
VALUES
  ('MMMBop', 238, '04-15-1997', 1, 1, 1),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2, 2, 3),
  ('One Sweet Day', 282, '11-14-1995', 3, 3, 4),
  ('Shallow', 216, '09-27-2018', 5, 4, 5),
  ('How You Remind Me', 223, '08-21-2001', 7, 5, 6),
  ('New York State of Mind', 276, '10-20-2009', 8, 6, 7),
  ('Dark Horse', 215, '12-17-2013', 10, 7, 8),
  ('Moves Like Jagger', 201, '06-21-2011', 12, 8, 10),
  ('Complicated', 244, '05-14-2002', 14, 9, 12),
  ('Say My Name', 240, '11-07-1999', 15, 10, 13);


--artist 2
UPDATE songs SET artist2 = 4 WHERE title = 'One Sweet Day';
UPDATE songs SET artist2 = 6 WHERE title = 'Shallow';
UPDATE songs SET artist2 = 9 WHERE title = 'New York State of Mind';
UPDATE songs SET artist2 = 11 WHERE title = 'Dark Horse';
UPDATE songs SET artist2 = 13 WHERE title = 'Moves Like Jagger';

--producer 2
UPDATE songs SET producer2 = 2 WHERE title = 'MMMBop';
UPDATE songs SET producer2 = 9 WHERE title = 'Dark Horse';
UPDATE songs SET producer2 = 11 WHERE title = 'Moves Like Jagger';