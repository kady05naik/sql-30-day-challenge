-- Have a look at the existing foreign key constraints by querying table_constraints in information_schema
SELECT 
	constraint_name, 
	table_name, 
	constraint_type
FROM 
	information_schema.table_constraints
WHERE 
	constraint_type = 'FOREIGN KEY';
	
	
	
-- Delete the affiliations_organization_id_fkey foreign key constraint in affiliations
ALTER TABLE affiliations
DROP CONSTRAINT affiliations_organization_id_fkey;



-- Add a new foreign key to affiliations that CASCADEs deletion if a referenced record is deleted from organizations. Name it affiliations_organization_id_fkey.
ALTER TABLE affiliations
ADD CONSTRAINT affiliations_organization_id_fkey FOREIGN KEY (organization_id) REFERENCES organizations (id) ON DELETE CASCADE;



-- Count the total number of affiliations per university
SELECT 
    count(*), 
    professors.university_id 
FROM affiliations
JOIN professors
    ON affiliations.professor_id = professors.id
GROUP BY professors.university_id 
ORDER BY count DESC;



-- Join all tables
SELECT 
    *
FROM affiliations
JOIN professors
    ON affiliations.professor_id = professors.id
JOIN organizations
    ON affiliations.organization_id = organizations.id
JOIN universities
    ON professors.university_id = universities.id;
	
	
	
-- Now group the result by organization sector, professor, and university city. Count the resulting number of rows.
SELECT 
    count(*), 
    organizations.organization_sector, 
    professors.id, 
    universities.university_city
FROM affiliations
JOIN professors
    ON affiliations.professor_id = professors.id
JOIN organizations
    ON affiliations.organization_id = organizations.id
JOIN universities
    ON professors.university_id = universities.id
GROUP BY 
    organizations.organization_sector, 
    professors.id, 
    universities.university_city;
	
	
	
-- Only retain rows with "Media & communication" as organization sector, and sort the table by count, in descending order.
SELECT 
    COUNT(*), 
    organizations.organization_sector, 
    professors.id, 
    universities.university_city
FROM affiliations
JOIN professors
    ON affiliations.professor_id = professors.id
JOIN organizations
    ON affiliations.organization_id = organizations.id
JOIN universities
    ON professors.university_id = universities.id
WHERE organizations.organization_sector = 'Media & communication'
GROUP BY 
    organizations.organization_sector, 
    professors.id, 
    universities.university_city
ORDER BY count DESC;