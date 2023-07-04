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
