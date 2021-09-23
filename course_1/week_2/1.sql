--  Create a table named automagic with the following fields:
--  An id field that is an auto-incrementing serial field.
--  A name field that allows up to 32 characters but no more. This field is required.
--  A height field that is a floating point number that is required.
CREATE TABLE automagic (
    id          serial,
    name        varchar(32) NOT NULL,
    height      real NOT NULL,
    PRIMARY KEY(id)
);