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

SELECT students.name AS 'student name', students.surname AS 'student surname', degrees.name AS 'cours name'
FROM degrees
JOIN students
ON degrees.id = students.degree_id 
WHERE degrees.name = 'Corso di Laurea in Economia';