-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy TEXT NOT NULL,
  moons_id INTEGER REFERENCES moons(id),
  -- moons TEXT[]
);

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy TEXT NOT NULL,
  planet_id INTEGER REFERENCES planets(id),
);

INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy, moons_id)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way', 1),
  ('Mars', 1.88, 'The Sun', 'Milky Way', 2,3),
  ('Venus', 0.62, 'The Sun', 'Milky Way', NULL),
  ('Neptune', 164.8, 'The Sun', 'Milky Way', 4,5,6,7,8,9,10,11,12,13,14,15,16,17),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', NULL),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', NULL);

INSERT INTO moons
  (name, orbits_around, galaxy, planet_id)
VALUES
  ('The Moon', 'Earth', 'Milky Way', 1),
  ('Phobos', 'Mars', 'Milky Way', 2),
  ('Deimos', 'Mars', 'Milky Way', 2),
  ('Naiad', 'Neptune', 'Milky Way', 4),
  ('Thalassa', 'Neptune', 'Milky Way', 4),
  ('Despina', 'Neptune', 'Milky Way', 4),
  ('Galatea', 'Neptune', 'Milky Way', 4),
  ('Larissa', 'Neptune', 'Milky Way', 4),
  ('S/2004 N 1', 'Neptune', 'Milky Way', 4),
  ('Proteus', 'Neptune', 'Milky Way', 4),
  ('Triton', 'Neptune', 'Milky Way', 4),
  ('Nereid', 'Neptune', 'Milky Way', 4),
  ('Halimede', 'Neptune', 'Milky Way', 4),
  ('Sao', 'Neptune', 'Milky Way', 4),
  ('Laomedeia', 'Neptune', 'Milky Way', 4),
  ('Psamathe', 'Neptune', 'Milky Way', 4),
  ('Neso', 'Neptune', 'Milky Way', 4);