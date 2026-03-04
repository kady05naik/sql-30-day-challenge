-- find out the number of rows in universities
SELECT  
	count(*)
FROM 
	universities;



-- find out how many unique values there are in the university_city column.
SELECT 
    COUNT(DISTINCT(university_city)) 
FROM 
    universities;
	
	
	
-- Rename the organization column to id in organizations. Make id a primary key and name it organization_pk.
-- Rename the organization column to id
ALTER TABLE organizations
RENAME organization TO id;

-- Make id a primary key
ALTER TABLE organizations
ADD CONSTRAINT organization_pk primary KEY (id);



-- Rename the university_shortname column to id in universities. Make id a primary key and name it university_pk.
-- Rename the university_shortname column to id
ALTER TABLE universities
RENAME COLUMN university_shortname TO id;

-- Make id a primary key
ALTER TABLE universities
ADD CONSTRAINT university_pk PRIMARY KEY (id);



-- Add a new column id with data type serial to the professors table.
ALTER TABLE professors 
ADD COLUMN id serial ;



-- Make id a primary key and name it professors_pkey.
-- Add the new column to the table
ALTER TABLE professors 
ADD COLUMN id serial;

-- Make id a primary key
ALTER TABLE professors
ADD CONSTRAINT professors_pkey PRIMARY KEY (id);



-- Write a query that returns all the columns and 10 rows from professors
SELECT 
    *
FROM 
    professors
LIMIT 10;



-- Count the number of distinct rows with a combination of the make and model columns.
SELECT
    count(DISTINCT(make, model))
FROM 
    cars;
	
	

-- Add a new column id with the data type varchar(128).
ALTER TABLE cars
ADD COLUMN id varchar(128);



-- Concatenate make and model into id using an UPDATE table_name SET column_name = ... query and the CONCAT() function.
-- Update id with make + model
UPDATE 
	cars
SET  
	id = CONCAT(make, model);
	
	
	
-- Make id a primary key and name it id_pk.
ALTER TABLE 
	cars
ADD CONSTRAINT id_pk PRIMARY KEY (id);



