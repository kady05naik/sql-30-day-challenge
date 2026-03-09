-- Which is the DROP command that would drop both top_15_2017 and top_artists_2017?
DROP VIEW top_15_2017 CASCADE;



-- Revoke all database users' update and insert privileges on the long_reviews view.
-- Grant the editor user update and insert privileges on the long_reviews view.
REVOKE UPDATE, INSERT ON long_reviews FROM PUBLIC; 



-- Redefine the artist_title view to have a label column
CREATE OR REPLACE VIEW artist_title AS
SELECT reviews.reviewid, reviews.title, artists.artist, labels.label
FROM reviews
INNER JOIN artists
ON artists.reviewid = reviews.reviewid
INNER JOIN labels
ON labels.reviewid = artists.reviewid;

SELECT * FROM artist_title;



-- Create a materialized view called genre_count 
CREATE MATERIALIZED VIEW genre_count AS
SELECT genre, COUNT(*) 
FROM genres
GROUP BY genre;

INSERT INTO genres
VALUES (50000, 'classical');

-- Refresh genre_count
REFRESH MATERIALIZED VIEW genre_count;

SELECT * FROM genre_count;



-- Create a data scientist role
CREATE ROLE data_scientist;

-- Create a role for Marta
CREATE ROLE Marta LOGIN;



-- Add Marta to the data scientist group
GRANT data_scientist TO marta;

-- Celebrate! You hired data scientists.

-- Remove Marta from the data scientist group
REVOKE data_scientist FROM marta;



-- Create a new table called film_descriptions
CREATE TABLE film_descriptions(
    film_id INT,
    long_description TEXT
);

-- Copy the descriptions from the film table
INSERT INTO film_descriptions
SELECT film_id, long_description FROM film;



-- Create a new table called film_descriptions
CREATE TABLE film_descriptions (
    film_id INT,
    long_description TEXT
);

-- Copy the descriptions from the film table
INSERT INTO film_descriptions
SELECT film_id, long_description FROM film;
    
-- Drop the descriptions from the original table
ALTER TABLE film 
DROP COLUMN long_description;

-- Join to view the original table
SELECT * FROM film 
JOIN film_descriptions USING(film_id);