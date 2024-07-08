USE ap;

-- Question 2
SELECT 
	invoice_id, 
    vendor_name, 
	COUNT(*) AS invoice_count,
    CONCAT('$ ', FORMAT(SUM(invoice_total), 2)) AS invoice_total_sum,
	CONCAT(FORMAT(AVG(invoice_total), 2)) AS invoice_average
FROM vendors
	JOIN invoices USING(vendor_id)
GROUP BY invoice_id, vendor_id; 

-- Question 3
USE ischool;
SELECT COUNT(*) AS Total_number_of_people
FROM people;

SELECT COUNT(title) AS People_titled
FROM people;

/*
COUNT(*) returns all rows from a table, regardless ohether or not it is NULL
COUNT(title) returns only non NULL rows for its title
*/
-- Question 4
USE ischool;
-- (1) -- 
SELECT section_id, delivery_id 
FROM course_sections
WHERE section_id > 120;

-- (2) --
SELECT COUNT(section_id) AS total_sections, delivery_id
FROM course_sections 
GROUP BY delivery_id;
