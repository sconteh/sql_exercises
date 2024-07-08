-- Assignment 4 - Samuel Conteh 
USE ischool_v2;

-- Question 1 
SELECT course_prereq, delivery_type, meeting_days, MAX(TIMEDIFF(end_time, start_time)) AS max_course_duration
 FROM courses 
 JOIN course_sections USING(course_id)
 JOIN delivery USING(delivery_id)
 GROUP BY course_prereq, delivery_type, meeting_days
 
 HAVING max_course_duration >= "02:45:00" AND course_prereq IS NOT NULL
 ORDER BY max_course_duration DESC;

-- Question 2 
SELECT COUNT(country) AS number_of_people, ROUND(AVG(zipcode), 0) AS average_zipcode, country, department 
FROM addresses
JOIN person_addresses USING(address_id)
JOIN people USING(person_id)
GROUP BY country, department 
HAVING average_zipcode >= "20706" AND number_of_people < 10
ORDER BY department DESC, number_of_people DESC;
