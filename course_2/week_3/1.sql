-- In this assignment you will create a table named bigtext with a single TEXT column named content. Insert 100000 records with numbers starting at 100000 and going through 199999 into the table
CREATE TABLE bigtext (
  id SERIAL,
  content TEXT
);

INSERT INTO bigtext (content) SELECT 'This is record number ' || generate_series(100000,199999) || ' of quite a few text records.';