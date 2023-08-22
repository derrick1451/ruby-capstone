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