CREATE TABLE departments(
    department_id INT NOT NULL AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(department_id)
);

INSERT INTO departments (department_name) VALUES
    ('Chemistry'),
    ('Physics'),
    ('Mathematics')
;

CREATE TABLE courses(
    course_id INT NOT NULL AUTO_INCREMENT,
    course_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(course_id)
);

INSERT INTO courses (course_name) VALUES
    ('Inorganic Chemistry I'),
    ('Physics I'),
    ('Physics II'),
    ('Calculus I'),
    ('Calculus II')
;

CREATE TABLE course_department(
    course_id INT,
    department_id INT
);

INSERT INTO course_department (department_id, course_id)
    select d.department_id, c.course_id
    from departments d
    JOIN courses c
    where c.course_name like '%Chemistry%' and d.department_name = 'Chemistry'
    OR c.course_name like '%Physics%'  and d.department_name = 'Physics'
    OR c.course_name like '%Calculus%' and d.department_name = 'Mathematics'
;

