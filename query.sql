SELECT *
FROM students
WHERE YEAR(date_of_birth) = '1990';

SELECT cfu
FROM courses
WHERE cfu > 10;

SELECT date_of_birth 
FROM students
WHERE YEAR(CURDATE()) - YEAR(date_of_birth) > 30;

SELECT `year`, period 
FROM courses
WHERE `year`  = 1
AND period = 'I semestre';

SELECT `date`, `hour` 
FROM exams
WHERE `date` = ' 2020-06-20'
AND `hour` >= '14:00';

SELECT `level` 
FROM degrees
WHERE `level`  = 'magistrale';

SELECT COUNT(id )
FROM departments;

SELECT phone 
FROM teachers
WHERE phone  <> 'null'

-- asegnazione del 15/10/2026 --

SELECT COUNT(id) AS tot_iscritti, YEAR(enrolment_date ) AS anno_iscrizione
FROM students
GROUP BY YEAR(enrolment_date );

SELECT office_address, office_number, COUNT(*) AS insegnatti_con_stesso_uffici
FROM teachers
GROUP BY office_address, office_number
HAVING COUNT(*) >1;

SELECT AVG(vote), exam_id 
FROM exam_student
GROUP BY exam_id;

SELECT COUNT(id), department_id
FROM degrees
GROUP BY department_id

-- join --

SELECT students.name AS 'student name', students.surname AS 'student surname', degrees.name AS 'cours name'
FROM degrees
JOIN students
ON degrees.id = students.degree_id 
WHERE degrees.name = 'Corso di Laurea in Economia';

SELECT departments.name, degrees.name, degrees.`level`
FROM departments
JOIN degrees
ON departments.id = degrees.department_id
WHERE level = 'magistrale'
AND departments.name  = 'Dipartimento di Neuroscienze'

SELECT teachers.id, teachers.name, teachers.surname, courses.name AS 'name course' 
FROM teachers
JOIN course_teacher
ON teachers.id = course_teacher.teacher_id 
JOIN courses
ON course_teacher.course_id = courses.id 
WHERE teachers.name = 'Fulvio'
AND teachers.surname = 'Amato'
-- where teachers.id = 44 --

SELECT students.name, students.surname, degrees.name AS 'name course', departments.name AS 'name department'
FROM students
JOIN degrees
ON students.id = degrees.department_id  
JOIN departments
ON degrees.department_id = departments.id 
ORDER BY students.name, students.surname;

-- Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti --
SELECT degrees.department_id, degrees.name AS 'course laurea', courses.name AS 'course', teachers.name AS 'name teacher', teachers.surname AS 'surname teacher'
FROM degrees
JOIN courses
ON degrees.id = degree_id
JOIN course_teacher
ON courses.id = course_teacher.course_id
JOIN teachers
ON course_teacher.teacher_id = teachers.id
ORDER BY department_id 

-- Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT departments.name AS 'dipartimento', teachers.name AS 'name teacher', teachers.surname AS ' surname teacher'
FROM departments
JOIN degrees
ON departments.id = degrees.department_id 
JOIN courses
ON degrees.id = courses.degree_id 
JOIN course_teacher
ON courses.id = course_teacher.course_id 
JOIN teachers
ON course_teacher.teacher_id = teachers.id
WHERE departments.id = 5
-- WHERE departments.name = 'Dipartimento di Matematica'

-- Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT students.id, 
students.name AS 'name student',
students.surname AS 'surname student',
exams.id AS 'exam',
COUNT(*) AS 'tentativi',
MAX(vote) AS 'voto piu alto'
FROM students
JOIN exam_student
ON students.id = exam_student.student_id 
JOIN exams
ON exam_student.exam_id = exams.id
-- WHERE exam_student.vote = 18
GROUP BY students.id, exams.id
ORDER BY COUNT(*) DESC;