-- This application will read an iTunes library in comma-separated-values (CSV) format and produce properly normalized tables as specified below.
CREATE TABLE album (
  id SERIAL,
  title VARCHAR(128) UNIQUE,
  PRIMARY KEY(id)
);

CREATE TABLE track (
    id SERIAL,
    title VARCHAR(128),
    len INTEGER, rating INTEGER, count INTEGER,
    album_id INTEGER REFERENCES album(id) ON DELETE CASCADE,
    UNIQUE(title, album_id),
    PRIMARY KEY(id)
);

DROP TABLE IF EXISTS track_raw;
CREATE TABLE track_raw(title TEXT, artist TEXT, album TEXT, album_id INTEGER, count INTEGER, rating INTEGER, len INTEGER);

\copy track_raw (title, artist, album, count, rating, len) FROM 'library.csv' WITH DELIMITER ',' CSV;

INSERT INTO album (title) SELECT DISTINCT album FROM track_raw;

UPDATE track_raw SET album_id = (SELECT album.id FROM album WHERE album.title = track_raw.album);

INSERT INTO track (title, len, rating, count, album_id) SELECT title, len, rating, count, album_id FROM track_raw;

SELECT track.title, album.title FROM track JOIN album ON track.album_id = album.id ORDER BY track.title LIMIT 3;