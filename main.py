import mysql.connector
from local_password import database_password


def query(query_string):
    cnx = mysql.connector.connect(user='root', password=database_password,
                              host='127.0.0.1',
                              database='university_enrollment')
    cursor = cnx.cursor(prepared=True)
    cursor.execute(query_string)
    results = cursor.fetchall()
    cnx.close()
    return results

# How many students are currently enrolled?
print(
    query(
        """
        select count(1)
        from students
        where status = 'enrolled'
        """
    )
)

# What courses are being offered by the chemistry department?
print(
    query(
        """
        select c.course_name
        from courses c
        join course_department cd
            on c.course_id = cd.course_id
        join departments d
            on cd.department_id = d.department_id
        where d.department_name = 'Chemistry'
        """
    )
)

# What is the average grade by department
print(
    query(
        """
        select d.department_name, AVG(sc.grade)
        from students s
        join student_courses sc on s.student_id = sc.student_id
        join courses c on sc.course_id = c.course_id
        join course_department cd on c.course_id = cd.course_id
        join departments d on d.department_id = cd.department_id
        where sc.grade is not NULL
        group by department_name
        """
    )
)

# What is the average grade for each separate course of the physics department?
print(
    query(
        """
        select c.course_name, AVG(sc.grade)
        from students s
        join student_courses sc on s.student_id = sc.student_id
        join courses c on sc.course_id = c.course_id
        join course_department cd on c.course_id = cd.course_id
        join departments d on d.department_id = cd.department_id
        where sc.grade is not NULL
        and d.department_name = 'Physics'
        group by c.course_name
        """
    )
)

# What courses are required for a BS in chemistry?
# TODO add tables degrees, degree_courses

# What courses does student 3 still need in order to get a BS in chemistry?

# What GPA does student 3 have right now? Make sure to only count the highest grade that student received for each
# course.

# Show a Gantt-style semesterly schedule of which courses student 3 can take, in which order (depending on prereqs),
# in order to complete a BS in Chemistry as fast as possible, if max credit-hours per semester is 21.
# TODO add table course_prerequisites
# TODO add python logic interface




