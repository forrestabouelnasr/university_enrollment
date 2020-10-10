CREATE TABLE students(
    student_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    status VARCHAR(20),
    PRIMARY KEY(student_id)
);

INSERT INTO students (first_name, last_name, status) VALUES
    ('fname1', 'lname1', 'enrolled'),
    ('fname2', 'lname2', 'enrolled'),
    ('fname3', 'lname3', 'graduated'),
    ('fname4', 'lname4', 'expelled'),
    ('fname5', 'lname5', '')
;
