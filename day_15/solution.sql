/*Let's think of an entity type "student". A student has:

a last name consisting of up to 128 characters (required),
a unique social security number, consisting only of integers, that should serve as a key,
a phone number of fixed length 12, consisting of numbers and characters (but some students don't have one). 
Given the above description of a student entity, create a table students with the correct column types.
Add a PRIMARY KEY for the social security number ssn.
*/
CREATE TABLE students (
  last_name VARCHAR(128) NOT NULL,
  ssn INTEGER PRIMARY KEY,
  phone_no CHAR(12)
);



-- Rename the university_shortname column to university_id in professors
ALTER TABLE 
	professors
RENAME university_shortname TO university_id;



-- Add a foreign key on university_id column in professors that references the id column in universities. Name this foreign key professors_fkey
ALTER TABLE professors
ADD CONSTRAINT professors_fkey FOREIGN KEY (university_id) REFERENCES universities (id);



-- Try to insert a new professor with firstname=Albert, lastname=Einstein, university_id=UZH
INSERT INTO professors (firstname, lastname, university_id)
VALUES ('Albert', 'Einstein', 'UZH');



-- Add a professor_id column with integer data type to affiliations, and declare it to be a foreign key that references the id column in professors.
ALTER TABLE affiliations
ADD COLUMN professor_id integer REFERENCES professors (id);



-- Rename the organization column in affiliations to organization_id.
ALTER TABLE affiliations
RENAME  organization TO organization_id;



-- Add a foreign key constraint on organization_id so that it references the id column in organizations.
ALTER TABLE affiliations
ADD CONSTRAINT affiliations_organization_fkey FOREIGN KEY (organization_id) REFERENCES  organizations (id);



-- Set professor_id to professors.id where firstname, lastname correspond to rows in professors
UPDATE affiliations
SET professor_id = professors.id
FROM professors
WHERE affiliations.firstname = professors.firstname 
        AND affiliations.lastname = professors.lastname;
		
		
		
-- Drop the firstname column
ALTER TABLE affiliations
DROP COLUMN firstname;



-- Drop the lastname column
ALTER TABLE affiliations
DROP COLUMN lastname;