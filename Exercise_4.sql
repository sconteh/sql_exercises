-- Assignment 4 - Samuel Conteh 
-- Question 1 
-- Part 1 
USE ischool_v2;

/* drops any previously occuring table copies, 
creates the copies of each table, 
and inserts the data from the original tables 
*/

DROP TABLE IF EXISTS people_copy;
CREATE TABLE people_copy LIKE people;
INSERT INTO people_copy SELECT * FROM people;

DROP TABLE IF EXISTS addresses_copy;
CREATE TABLE addresses_copy LIKE addresses;
INSERT INTO addresses_copy SELECT * FROM addresses;

DROP TABLE IF EXISTS person_addresses_copy;
CREATE TABLE person_addresses_copy LIKE person_addresses;
INSERT INTO person_addresses_copy SELECT * FROM person_addresses;

-- Part 2 
/* creating a new profile within each of the different copy tables 
and inserting specific attributes to them
*/

INSERT INTO people_copy(lname, fname, email, college, department, title, start_date)
VALUES('Soprano', 'Tony', 'tsoprano@mobmail.com', 'Robert H. Smith School of Business', 'BMGT', 'Capo', '1999-01-10');

-- Part 3 
INSERT INTO addresses_copy(address_id, street, city, state, zipcode, country, main_phone)
VALUES(146, '633 Stag Trail Road', 'North Caldwell', 'NJ', '07004', 'United States', '917-55-0157');

-- Part 4
INSERT INTO person_addresses_copy(person_id, address_id)
VALUES('132466128', 146);

-- Part 5 
-- querying each table 
SELECT * FROM people_copy;
SELECT * FROM addresses_copy;
SELECT * FROM person_addresses_copy;

-- Question 2 
-- Updating the values of Tony
-- Part 1
UPDATE person_addresses_copy
SET address_id = '6'
WHERE person_id = '132466128' AND address_id = '146';

-- Part 2
-- checking if the correct changes have been made 
SELECT person_id, address_id, CONCAT(fname, ', ', lname) AS full_name, street, CONCAT(city, ', ', country) AS location_name, main_phone
FROM person_addresses_copy
JOIN people_copy USING(person_id)
JOIN addresses_copy USING(address_id)
 
WHERE main_phone > '703-555-5203' AND main_phone < '877-555-7472'
ORDER BY country, lname DESC;

-- Question 3 
-- Deleting Tony from the database X_X
-- Part 1 
DELETE FROM people_copy
WHERE person_id = '132466128';

DELETE FROM addresses_copy
WHERE address_id = '146';

DELETE FROM person_addresses_copy
WHERE person_id = '132466128' AND address_id = '146';

-- querying the table to check if he has been deleted 
SELECT person_id, address_id, CONCAT(fname, ', ', lname) AS full_name, street, CONCAT(city, ', ', country) AS location_name, main_phone
FROM person_addresses_copy
JOIN people_copy USING(person_id)
JOIN addresses_copy USING(address_id)

WHERE main_phone > '703-555-5203' AND main_phone < '877-555-7472'
ORDER BY country, lname DESC;
