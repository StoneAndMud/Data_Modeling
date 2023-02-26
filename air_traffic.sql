-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  passenger_id INTEGER REFERENCES passengers(id),
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline_id INTEGER REFERENCES airlines(id),
  from_city_id INTEGER REFERENCES cities(id),
  to_city_id INTEGER REFERENCES cities(id),
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  city_name TEXT NOT NULL,
  country_id INTEGER REFERENCES countries(id),
);

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  country_name TEXT NOT NULL,
);

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL,
);

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
)

INSERT INTO tickets
  (passenger_id seat, departure, arrival, airline_id, from_city_id, from_country_id, to_city_id, to_country_id)
VALUES
  (1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 1, 1, 2),
  (2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 3, 2, 4),
  (3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 5, 1, 6),
  (1, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3, 2, 1, 7),
  (4, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4, 8, 5, 9),
  (2, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 5, 10, 7, 11),
  (5, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1, 12, 1, 13),
  (6, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6, 14, 1, 15),
  (5, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 13, 1, 16),
  (7, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7, 17, 9, 18);

INSERT INTO cities
  (id, city_name, country_id)
VALUES
  (1, 'Washington DC', 1),
  (2, 'Seattle', 1),
  (3, 'Tokyo', 2),
  (4, 'London', 3),
  (5, 'Los Angeles', 1),
  (6, 'Las Vegas', 1),
  (7, 'Mexico City', 4),
  (8, 'Paris', 5),
  (9, 'Casablanca', 6),
  (10, 'Dubai', 7),
  (11, 'Beijing', 8),
  (12, 'New York', 1),
  (13, 'Charlotte', 1),
  (14, 'Cedar Rapids', 1),
  (15, 'Chicago', 1),
  (16, 'New Orleans', 1),
  (17, 'Sao Paolo', 9),
  (18, 'Santiago', 10);

INSERT INTO countries
  (id, country_name)
VALUES
  (1, 'United States'),
  (2, 'Japan'),
  (3, 'United Kingdom'),
  (4, 'Mexico'),
  (5, 'France'),
  (6, 'Morocco'),
  (7, 'UAE'),
  (8, 'China'),
  (9, 'Brazil'),
  (10, 'Chile');

INSERT INTO airlines
  (id, airline_name)
VALUES
  (1, 'United'),
  (2, 'British Airways'),
  (3, 'Delta'),
  (4, 'TUI Fly Belgium'),
  (5, 'Air China'),
  (6, 'American Airlines'),
  (7, 'Avianca Brasil');

INSERT INTO passengers
  (id, first_name, last_name)
VALUES
  (1, 'Jennifer', 'Finch'),
  (2, 'Thadeus', 'Gathercoal'),
  (3, 'Sonja', 'Pauley', ),
  (4, 'Waneta', 'Skeleton'),
  (5, 'Berkie', 'Wycliff'),
  (6, 'Alvin', 'Leathes'),
  (7, 'Cory', 'Squibbes'),
  (6, 'Alvin', 'Leathes');