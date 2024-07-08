# This repository contains various exercises that I have done to introduce and familiarize myself with the various SQL concepts such as queries, joins, subquries, CTEs, table creation, and more. 

Exercise 1 
- Provided the street name, number, city, state, country, and main phonen number from an addresses table. The second query shows the location code, building name, and room number of various UMD buildings that is above the room number 1000. 
- Introduction to the basics of SELECT, FROM, WHERE, and ORDER BY. I also utilized 'AS' to change the visual representation of a variable. 

Exercise 2 
- Joined information from a section_location, course_sections, and courses table to list the section location, section number, course_prerequisites, and the time duration of specific courses. Also did a LEFT join to show the potential department, location name, state, and zipcode of several individuals. 
- Built upon these basic concepts by implementing concatenations, JOIN clauses, UNION clauses,  and IS NULL/IS NOT NULL clauses.

Exercise 3 
- Explored various aggregate functions such as COUNT, FORMAT, and AVG. Used them to complete operations on the vendors peoplpe, and course_sections tables.

Exercise 4 
- Created a copy of the person_addresses, people, and addresses tables and inserted different values into it. I then joined them and performed a query to display all of those changed values. I then deleted specified information because a select user needed to be taken out. I did a query double checking if they were successfully taken out.  
- Learned the table creation process.    

Exercise 5 
- Displayed the course prerequisites, meeting type, meeting days, and the max course duration.
- Use TIMEDIFF to find the value using the end_time and start_time variables

Exercise 6 
- Selected course number and prereqs from the courses table granted that the max course number is greater than INST500. I then rewrote this code as a subquery. I did the same process with a CTE, but changed to a HAVING earliest_course_end_time being less than or equal to 4:45 PM.   
- Worked on clauses pertaining to aggregate functions as well as subqueries/CTEs.

Exercise 7 
- Created a view of people_from_location_in bsis to view the GEO location, the department, and the number of peeople in the department within a specific table.
