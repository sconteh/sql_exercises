USE ischool_v2;

-- Question 1
SELECT concat(building_code, ", Room ", room_number) AS "Section Location", 
section_number, 
course_prereq,
concat(start_time, " to ", end_time) AS time_interval

FROM locations l
JOIN section_location sl USING(location_id)
JOIN course_sections cs USING(section_id)
JOIN courses c USING(course_id)

WHERE course_prereq IS NOT NULL AND start_time > "12:29:00" AND end_time < "14:51:00"

UNION

SELECT concat(building_code, ", Room ", room_number) AS "Section Location", 
section_number, 
"No prerequisites" AS course_prereq,
concat(start_time, " to ", end_time) AS time_interval

FROM locations l
JOIN section_location sl USING(location_id)
JOIN course_sections cs USING(section_id)
JOIN courses c USING(course_id)

WHERE course_prereq IS NULL AND start_time > "12:29:00" AND end_time < "14:51:00"
ORDER BY time_interval, section_number ASC, course_prereq; 

-- Question 2 
SELECT department, concat(fname, " ", lname) AS "Full Name", concat(city, ", ", country) AS "Location Name", state, zipcode 
FROM people
LEFT JOIN person_addresses USING(person_id)
LEFT JOIN addresses USING(address_id)

WHERE state IS NULL AND fname > "Q" 
ORDER BY department, zipcode DESC;

