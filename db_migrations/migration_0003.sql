alter table student_courses
add foreign key (student_id) references students(student_id);

alter table student_courses
add foreign key (course_id) references courses(course_id);

alter table course_department
add foreign key (course_id) references courses(course_id);

alter table course_department
add foreign key (department_id) references departments(department_id);

alter table courses
add column credit_hours FLOAT;

update courses
set credit_hours = 3;