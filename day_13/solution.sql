-- Insert all DISTINCT affiliations into affiliations from university_professors and print. 
INSERT INTO  affiliations 
    SELECT 
        firstname, 
        lastname, 
        function, 
        organization 
    FROM 
        university_professors;

SELECT * 
FROM affiliations;


-- Delete the university_professors table.
DROP TABLE university_professors;


-- Calculate the net amount as amount + fee
SELECT 
    transaction_date, 
    amount + CAST (fee AS INTEGER)  AS net_amount 
FROM 
    transactions;
	
	
-- Find distinct university_shortname values in the professors table and take note of the length of the strings.
SELECT 
    DISTINCT university_shortname, 
    LENGTH(university_shortname)
FROM 
    professors;
	

-- ALTER the fixed-length 3 character type to university_shortname
ALTER TABLE professors
ALTER COLUMN university_shortname
TYPE char(3);


-- Change the type of the firstname column to varchar(64)
ALTER TABLE professors
ALTER COLUMN firstname
TYPE varchar(64);


-- Convert the values in firstname to a max. of 16 characters
ALTER TABLE professors 
ALTER COLUMN firstname 
TYPE varchar(16)
USING SUBSTRING(firstname FROM 1 FOR 16);


-- Add a not-null constraint for the firstname column.
ALTER TABLE  professors 
ALTER COLUMN firstname SET NOT NULL;


-- Add a not-null constraint for the lastname column.
ALTER TABLE professors
ALTER COLUMN lastname SET NOT NULL;


-- Add a unique constraint to the university_shortname column in universities. Give it the name university_shortname_unq.
ALTER TABLE universities 
ADD CONSTRAINT university_shortname_unq UNIQUE(university_shortname);


-- Add a unique constraint to the organization column in organizations. Give it the name organization_unq.
ALTER TABLE organizations
ADD CONSTRAINT organization_unq UNIQUE(organization);
