-- You will normalize the following data (each user gets different data),
-- and insert the following data items into your database, creating and linking
-- all the foreign keys properly.
-- Encode instructor with a role of 1 and a learner with a role of 0

-- Jessna, si106, Instructor
-- Caitaidh, si106, Learner
-- Eniola, si106, Learner
-- Lukas, si106, Learner
-- Titus, si106, Learner

-- Hagun, si110, Instructor
-- Cathal, si110, Learner
-- Ewa, si110, Learner
-- Romany, si110, Learner
-- Shola, si110, Learner

-- Arabella, si206, Instructor
-- Aiadan, si206, Learner
-- Caolain, si206, Learner
-- Casey, si206, Learner
-- Mhia, si206, Learner

CREATE TABLE student (
    id SERIAL,
    name VARCHAR(128) UNIQUE,
    PRIMARY KEY(id)
);

DROP TABLE course CASCADE;
CREATE TABLE course (
    id SERIAL,
    title VARCHAR(128) UNIQUE,
    PRIMARY KEY(id)
);

DROP TABLE roster CASCADE;
CREATE TABLE roster (
    id SERIAL,
    student_id INTEGER REFERENCES student(id) ON DELETE CASCADE,
    course_id INTEGER REFERENCES course(id) ON DELETE CASCADE,
    role INTEGER,
    UNIQUE(student_id, course_id),
    PRIMARY KEY (id)
);

INSERT INTO student (name) VALUES ('Jessna'), ('Caitaidh'), ('Eniola'),
('Lukas'), ('Titus'), ('Hagun'), ('Cathal'), ('Ewa'), ('Romany'), ('Shola'), ('Arabella'),
('Aiadan'), ('Caolain'), ('Casey'), ('Mhia');

INSERT INTO course (title) VALUES ('si106'), ('si110'), ('si206');

INSERT INTO roster (student_id, course_id, role) VALUES (1,1,1), (2,1,0), (3,1,0), (4,1,0),
(5,1,0), (6,2,1), (7,2,0), (8,2,0), (9,2,0), (10,2,0), (11,3,1), (12,3,0), (13,3,0), (14,3,0), (15,3,0);

SELECT student.name, course.title, roster.role
    FROM student
    JOIN roster ON student.id = roster.student_id
    JOIN course ON roster.course_id = course.id
    ORDER BY course.title, roster.role DESC, student.name;

