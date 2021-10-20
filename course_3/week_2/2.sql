-- In this assignment, you will create a table of documents and then produce a GIN-based ts_vector index on the documents. In this assignment, you will create a table of documents and then produce a GIN-based ts_vector index on the documents.
CREATE TABLE docs03 (id SERIAL, doc TEXT, PRIMARY KEY(id));
CREATE INDEX fulltext03 ON docs03 USING gin(to_tsvector('english', doc));

INSERT INTO docs03 (doc) VALUES
('have very special meaning to Python When Python sees these words in a'),
('Python program they have one and only one meaning to Python Later as'),
('you write programs you will make up your own words that have meaning to'),
('you called variables You will have great latitude in'),
('choosing your names for your variables but you cannot use any of'),
('Pythons reserved words as a name for a variable'),
('When we train a dog we use special words like sit stay and'),
('they just look at you with a quizzical look on their face until you say'),
('a reserved word For example if you say I wish more people would walk'),
('to improve their overall health what most dogs likely hear is blah');

INSERT INTO docs03 (doc) SELECT 'Neon ' || generate_series(10000,20000);
SELECT id, doc FROM docs03 WHERE to_tsquery('english', 'quizzical') @@ to_tsvector('english', doc);
EXPLAIN SELECT id, doc FROM docs03 WHERE to_tsquery('english', 'quizzical') @@ to_tsvector('english', doc);