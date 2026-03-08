SELECT 
    count(*)olt
FROM dim_store_star
WHERE country != 'USA' 
    AND country !='CA';



-- Add a continent_id column with default value of 1
ALTER TABLE dim_country_sf
   ADD COLUMN continent_id int NOT NULL DEFAULT(1);

-- Add the foreign key constraint
ALTER TABLE dim_country_sf
   ADD  CONSTRAINT country_continent
   FOREIGN KEY (continent_id) REFERENCES dim_continent_sf(continent_id);
   
-- Output updated table
SELECT * FROM dim_country_sf;



/*
Scenario:cars_rented holds one or more car_ids and invoice_id holds multiple values. 
Create a new table to hold individual car_ids and invoice_ids of the customer_ids who've rented those cars.
Drop two columns from customers table to satisfy 1NF
*/
-- Create a new table to hold the cars rented by customers
CREATE TABLE cust_rentals (
  customer_id INT NOT NULL,
  car_id VARCHAR(128) NULL,
  invoice_id VARCHAR(128) NULL
);

-- Drop two columns from customers table to satisfy 1NF
ALTER TABLE customers
DROP COLUMN cars_rented,
DROP COLUMN invoice_id;



/*
Create a new table for the non-key columns that were conflicting with 2NF criteria.
Drop those non-key columns from customer_rentals.
*/
-- Create a new table to satisfy 2NF
CREATE TABLE cars (
  car_id VARCHAR(256) NULL,
  model VARCHAR(128),
  manufacturer VARCHAR(128),
  type_car VARCHAR(128),
  condition VARCHAR(128),
  color VARCHAR(128)
);

-- Insert data into the new table
INSERT INTO cars
SELECT DISTINCT
  car_id,
  model,
  manufacturer,
  type_car,
  condition,
  color
FROM customer_rentals;

-- Drop columns in customer_rentals to satisfy 2NF
ALTER TABLE customer_rentals
  DROP COLUMN model,
  DROP COLUMN manufacturer,
  DROP COLUMN type_car,
  DROP COLUMN condition,
  DROP COLUMN color;
  
  

-- Query the information schema to get views. Exclude system views in the results.
SELECT 
    * 
FROM 
    information_schema.views
WHERE table_schema NOT IN  ('pg_catalog', 'information_schema');



-- Create a view called high_scores that holds reviews with scores above a 9.
CREATE VIEW high_scores AS
    SELECT * 
    FROM reviews
    WHERE score > 9;
	
	

-- Count the number of records in high_scores that are self-released in the label field of the labels table.
SELECT 
    COUNT(*) 
FROM labels
INNER JOIN high_scores 
    ON labels.reviewid = high_scores.reviewid
WHERE label = 'self-released';



/*
Create a view called top_artists_2017 with artist from artist_title.
To only return the highest scoring artists of 2017, join the views top_15_2017 and artist_title on reviewid.
Output top_artists_2017.
*/

CREATE VIEW  top_artists_2017 AS
    SELECT artist_title.artist 
    FROM top_15_2017
    INNER JOIN artist_title
        ON top_15_2017.reviewid = artist_title.reviewid;


SELECT 
	* 
FROM 
	top_artists_2017;

