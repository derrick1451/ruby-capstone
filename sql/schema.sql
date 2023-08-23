CREATE DATABASE catalogue_of_things;
-- create books table 
CREATE TABLE books (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    genre varchar(100) NOT NULL,
    author varchar(100) NOT NULL,
    source varchar(100) NOT NULL,
    label varchar(100) NOT NULL,
    publish_date DATE NOT NULL,
    arcieved BOOLEAN,
    publisher varchar(100) NOT NULL,
    cover_state varchar(100) NOT NULL
);

-- create labels table
CREATE TABLE labels(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title varchar(100) NOT NULL,
    color varchar(100) NOT NULL,
    items varchar(100)[] NOT NULL
);

CREATE TABLE albums (
  id int GENERATED ALWAYS AS IDENTITY,
  on_spotify boolean,
  PRIMARY KEY(id),
  item_id int NOT NULL,
  CONSTRAINT kf_items FOREIGN KEY(item_id) REFERENCES items(id) ON DELETE CASCADE
);

CREATE TABLE genres (
  id int,
  name varchar(45),
  PRIMARY KEY(id)
);

CREATE TABLE items (
  id int GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
  PRIMARY KEY (id),
  genre varchar(30),
  author varchar(30),
  source varchar(30),
  label varchar(30),
  publish_date int,
  archived boolean,
  author_id int,
  game_id int,
  album_id int, 
  genre_id int,
  CONSTRAINT kf_albums FOREIGN KEY(album_id) REFERENCES albums(id) ON DELETE CASCADE,
  CONSTRAINT kf_genres FOREIGN KEY(genre_id) REFERENCES genres(id) ON DELETE CASCADE
); 