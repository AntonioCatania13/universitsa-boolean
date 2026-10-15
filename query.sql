SELECT *
FROM students
WHERE YEAR(date_of_birth) = '1990';

SELECT cfu
FROM courses
WHERE cfu > 10;

SELECT date_of_birth 
FROM students
WHERE YEAR(CURDATE()) - YEAR(date_of_birth) > 30;