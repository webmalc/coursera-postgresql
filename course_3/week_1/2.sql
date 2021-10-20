-- In this assignment, you will create a table of documents and then produce a reverse index with stop words for those documents that identifies each document which contains a particular word using SQL.

CREATE TABLE docs02 (id SERIAL, doc TEXT, PRIMARY KEY(id));

CREATE TABLE invert02 (
  keyword TEXT,
  doc_id INTEGER REFERENCES docs02(id) ON DELETE CASCADE
);

INSERT INTO docs02 (doc) VALUES
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

CREATE TABLE stop_words (word TEXT unique);

INSERT INTO stop_words (word) VALUES
('i'), ('a'), ('about'), ('an'), ('are'), ('as'), ('at'), ('be'),
('by'), ('com'), ('for'), ('from'), ('how'), ('in'), ('is'), ('it'), ('of'),
('on'), ('or'), ('that'), ('the'), ('this'), ('to'), ('was'), ('what'),
('when'), ('where'), ('who'), ('will'), ('with');

INSERT INTO invert02 (doc_id, keyword) SELECT DISTINCT id, s.keyword AS keyword FROM docs02 as d, unnest(string_to_array(lower(d.doc), ' ')) s(keyword) WHERE s.keyword NOT IN (SELECT word FROM stop_words)  ORDER BY id;