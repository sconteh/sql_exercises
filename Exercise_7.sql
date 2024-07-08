-- Assignment 7 - Samuel Conteh 
USE ischool_v2;

CREATE OR REPLACE VIEW people_from_location_in_bsis AS 
SELECT IFNULL(CONCAT(city, ', ', state, ', ', country), "ADDRESS UNKNOWN") AS GEO_location, department AS Department, COUNT(department) AS Number_in_Department
FROM addresses
JOIN person_addresses USING(address_id)
JOIN people USING(person_id)
WHERE department = "BSIS"
GROUP BY GEO_location, department
ORDER BY Number_in_Department DESC, GEO_location;

-- There's a firmware issue that is preventing the cities in the GEO_location from properly ascending in alphabetical order. 

USE ischool_v2;
SELECT * FROM people_from_location_in_bsis

-- Bonus Question 
/*
How I have my VIEW set up currently, the VIEW is updatable. The 'OR REPLACE' part of the clause allows the VIEW to override the currently
set one so that in the cases in which it is run multiple times, I do not recieve an error for duplicity. 
*/