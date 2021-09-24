-- Insert the following data into your database separating it appropriately into
-- the make and model tables and setting the make_id foreign key to link each model to its corresponding make.
-- make	model
-- Kia	Spectra 2.0L
-- Kia	Sportage 2WD
-- Kia	Sportage 4WD
-- Mercedes-Benz	SLR
-- Mercedes-Benz	SLS AMG
CREATE TABLE make (
	id SERIAL,
	name VARCHAR(128) UNIQUE,
	PRIMARY KEY(id)
);

CREATE TABLE model (
	id SERIAL,
	name VARCHAR(128),
	make_id INTEGER REFERENCES make(id) ON DELETE CASCADE,
	PRIMARY KEY(id)
);
INSERT INTO make (name) VALUES ('Kia'), ('Mercedes-Benz');
SELECT * FROM make;
INSERT INTO model (name, make_id) VALUES ('Spectra 2.0L', 1), ('Sportage 2WD', 1), ('Sportage 4WD', 1), ('SLR', 2), ('SLS AMG', 2);
SELECT make.name, model.name
    FROM model
    JOIN make ON model.make_id = make.id
    ORDER BY make.name LIMIT 5;