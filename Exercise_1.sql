USE ischool;
-- Question 1 

SELECT street AS "Street Name and Number", concat(city, ' ', state) AS "Place Name",
country AS "Country of Residence",
main_phone AS "Main Phone Number" 

FROM addresses
WHERE state IS NOT NULL AND main_phone > "300" AND main_phone < "600"
ORDER BY state DESC, city DESC;

-- Question 2 
SELECT CONCAT(building_code, location_id) AS "Location Code",
building_name AS "Building Name", 
room_number AS "Room No."
FROM locations
WHERE room_number > 1000
ORDER BY room_number DESC;
