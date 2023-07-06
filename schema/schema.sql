CREATE TABLE music_album(
  id INT SERIAL PRIMARY KEY,
  on_spotify BOOLEAN,
  publish_date DATE,
  archive BOOLEAN
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
  last_time_played DATE
);

CREATE TABLE authors(
  id int primary key GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100)
);

CREATE TABLE books(
  id int primary key GENERATED ALWAYS AS IDENTITY,
  publisher VARCHAR(100),
  publish_date DATE,
  archive BOOLEAN,
  cover_state VARCHAR(100)
);

CREATE TABLE labels(
  id int primary key GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100)
);

alter table books
add foreign key(label_id)
REFERENCES labels(id),

add foreign key(genre_id)
REFERENCES genre(id);

add foreign key(author_id)
REFERENCES author(id);

alter table games
add foreign key(label_id)
REFERENCES labels(id),

add foreign key(genre_id)
REFERENCES genre(id);

add foreign key(author_id)
REFERENCES author(id);

alter table music_album
add foreign key(label_id)
REFERENCES labels(id),

add foreign key(genre_id)
REFERENCES genre(id);

add foreign key(author_id)
REFERENCES author(id);

create index on music_album (label_id)
create index on music_album (genre_id)
create index on music_album (author_id)

create index on books (label_id)
create index on books (genre_id)
create index on books (author_id)

create index on games (label_id)
create index on games (genre_id)
create index on games (author_id)