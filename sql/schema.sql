 CREATE DATABASE catalogue_of_things;
-- create books table 
CREATE TABLE book (
  id int GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
  publisher varchar(30),
  cover_state varchar(30),
  item_id int,
  CONSTRAINT fk_item FOREIGN KEY(item_id) REFERENCES items(id) ON DELETE CASCADE,
  PRIMARY KEY (id)
);

CREATE TABLE label (
  id int GENERATED ALWAYS AS IDENTITY NOT NULL,
  title varchar(50) NOT NULL,
  color varchard(50) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE items (
  id int GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
  genre int,
  author int,
  label int,
  publish_date date,
  archived boolean,
  author_id int,
  game_id int,
  book_id int,
  CONSTRAINT fk_label FOREIGN KEY(label) REFERENCES label(id) ON DELETE CASCADE,
  CONSTRAINT fk_book FOREIGN KEY(book_id) REFERENCES book(id) ON DELETE CASCADE,
  PRIMARY KEY (id)
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

CREATE TABLE games (
  id int GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
  PRIMARY KEY (id),
  title varchar(30),
  multiplayer boolean,
  last_played_at date,
  item_id int NOT NULL,
  CONSTRAINT kf_items FOREIGN KEY(item_id) REFERENCES items(id) ON DELETE CASCADE,
);

CREATE TABLE authors (
  id int GENERATED ALWAYS AS IDENTITY(MINVALUE 0 START WITH 0 CACHE 20) NOT NULL,
  PRIMARY KEY (id),
  first_name varchar(30),
  last_name varchar(30)
);