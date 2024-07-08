-- Samuel Conteh - Assignment 6 
-- Question 1 
USE ischool_v2;

-- Original Query 
SELECT MAX(CONCAT(course_code, course_number)) AS max_course_number,
course_prereq
FROM courses
WHERE course_prereq NOT LIKE "C- (INST201/301)"
GROUP BY course_prereq
HAVING max_course_number > "INST500"
ORDER BY max_course_number;

-- Rewritten Subquery 
SELECT max_course_number, course_prereq 
FROM(SELECT MAX(CONCAT(course_code, course_number)) AS max_course_number,
	course_prereq
    FROM courses
	WHERE course_prereq NOT LIKE "C- (INST201/301)"
    GROUP BY course_prereq) AS course_subquery
WHERE max_course_number > "INST500"
ORDER BY max_course_number;

-- Question 2 
USE ischool_v2;
WITH BuildingCourseInfo AS (
	SELECT
		building_name, 
        MIN(DISTINCT end_time) AS earliest_course_end_time,
        COUNT(DISTINCT start_time) AS unique_course_start_time
	FROM locations
		JOIN section_location USING(location_id)
		JOIN course_sections USING(section_id)
	GROUP BY building_name, location_id
    HAVING earliest_course_end_time <= '16:45:00' 
)
SELECT DISTINCT building_name, earliest_course_end_time, unique_course_start_time
FROM BuildingCourseInfo
WHERE unique_course_start_time >= 2 AND unique_course_start_time <= 6
ORDER BY building_name, earliest_course_end_time DESC;

-- Bonus Points 
/*
I decided to use a common table expression (CTE) for question. I have been doing a bit of digging into what professionals 
tend to subqueries and CTEs for. Trying to find all the unique course start times for each unique building earliest course start time  
may be a function that one would like to use temporarily and possibly double check after infomation has been changed within the dataset.
Also, maybe one would just want this information for a brief moment. I also wanted practice with it :)
*/