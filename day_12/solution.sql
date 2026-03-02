-- Get information on all table names in the current database, while limiting your query to the 'public' table_schema
SELECT 
    table_name 
FROM 
    information_schema.tables
WHERE 
    table_schema = 'public';
	

-- Query the right table in information_schema to get columns
SELECT 
    column_name, 
    data_type 
FROM 
    information_schema.columns 
WHERE table_name = 'university_professors' 
    AND table_schema = 'public';
	
	
-- How many columns does the table university_professors have?
select 
    count(*)
FROM
    Information_schema.columns
WHERE table_schema='public' 
    AND table_name='university_professors'
	

-- Create a table professors with two text columns: firstname and lastname, Print the contents of this table
CREATE TABLE professors (
 firstname text,
 lastname text
);

SELECT * 
FROM professors


-- Create a table universities with three text columns: university_shortname, university, and university_city. Print the contents of this table
CREATE TABLE universities
(
    university_shortname text,
    university text,
    university_city text
);

SELECT * 
FROM universities;


-- Alter professors to add the text column university_shortname. Print the contents of this table
ALTER TABLE professors
ADD COLUMN university_shortname text;

SELECT * 
FROM professors;


-- Rename the organisation column to organization in affiliations.
ALTER TABLE affiliations
RENAME COLUMN organisation TO organization;


-- Delete the university_shortname column in affiliations.
ALTER TABLE affiliations
DROP COLUMN university_shortname;


-- Insert all DISTINCT professors from university_professors into professors. Print all the rows in professors.
INSERT INTO  professors 
	SELECT 
		DISTINCT firstname, 
		lastname, 
		university_shortname 
	FROM 
		university_professors;

SELECT * 
FROM professors;


