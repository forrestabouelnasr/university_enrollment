CREATE TABLE student_courses (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    status VARCHAR(20),
    grade FLOAT DEFAULT NULL,
    complete_date TIMESTAMP DEFAULT NULL)
;

INSERT INTO student_courses(student_id, course_id, status, grade, complete_date) VALUES
    (2, 1, 'in progress', NULL, NULL),
    (2, 4, 'in progress', NULL, NULL),
    (3, 2, 'complete', 95.1, NOW()),
    (4, 2, 'complete', 61.6, NOW()),
    (4, 2, 'complete', 88.4, NOW() - INTERVAL 1 year),
    (5, 3, 'incomplete', NULL, NULL),
    (6, 5, 'complete', 0, NOW());