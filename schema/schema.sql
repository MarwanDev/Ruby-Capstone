CREATE TABLE music_album(
  id INT SERIAL PRIMARY KEY,
  on_spotify BOOLEAN,
  publish_date DATE,
  archive BOOLEAN,
  genre_id INT REFERENCES genre(id)
);

CREATE TABLE genre(
  id INT SERIAL PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE games(
  id int primary key GENERATED ALWAYS AS IDENTITY,
  multiplayer BOOLEAN,
  publish_date DATE,
  archive BOOLEAN,
  last_time_played DATE,
  genre_id INT REFERENCES genre(id)
  author_id INT REFERENCES authors(id)
);

CREATE TABLE authors(
  id int primary key GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100)
);