-- Create a route dimension table
CREATE TABLE route(
	route_id INTEGER PRIMARY KEY,
    route_name VARCHAR(160) NOT NULL,
    park_name  VARCHAR(160) NOT NULL,
    distance_km FLOAT NOT NULL,
    city_name  VARCHAR(160) NOT NULL
);



-- Create a week dimension table
CREATE TABLE week(
	week_id INTEGER PRIMARY KEY,
    week INTEGER NOT NULL,
    month  VARCHAR(160) NOT NULL,
    duration_mins FLOAT NOT NULL,
    year INTEGER NOT NULL
);



-- Calculate the sum of the duration_mins column.
SELECT 
	SUM(duration_mins) As total_duration_mins
FROM 
	runs_fact;
	
	

-- Join week_dim and runs_fact. Get all the week_id's from July, 2019.
SELECT 
	SUM(duration_mins)
FROM 
	runs_fact
INNER JOIN week_dim ON runs_fact.week_id = week_dim.week_id
WHERE month = 'July' and year = '2019';



-- In the constraint called sales_book, set book_id as a foreign key.
-- In the constraint called sales_time, set time_id as a foreign key.
-- In the constraint called sales_store, set store_id as a foreign key.

ALTER TABLE fact_booksales 
    ADD CONSTRAINT sales_book
    FOREIGN KEY (book_id) 
    REFERENCES dim_book_star (book_id);
    
ALTER TABLE  fact_booksales
    ADD CONSTRAINT sales_time
    FOREIGN KEY(time_id) 
    REFERENCES  dim_time_star(time_id);
    
ALTER TABLE fact_booksales
    ADD CONSTRAINT sales_store
    FOREIGN KEY(store_id) 
    REFERENCES dim_store_star(store_id);



-- Create dim_author with a column for author.
-- Insert all the distinct authors from dim_book_star into dim_author.
CREATE TABLE dim_author (
    author varchar(256)  NOT NULL
);

INSERT INTO dim_author
SELECT DISTINCT author  FROM dim_book_star;



-- Alter dim_author to have a primary key called author_id.
-- Output all the columns of dim_author.
ALTER TABLE dim_author 
    ADD COLUMN author_id SERIAL PRIMARY KEY;
	
SELECT 
    * 
FROM 
    dim_author;
	
	
	

SELECT 
    dim_store_star.state, 
    SUM(sales_amount)
FROM 
    fact_booksales
JOIN dim_book_star
    ON fact_booksales.book_id = dim_book_star.book_id
JOIN dim_store_star 
    ON fact_booksales.store_id = dim_store_star.store_id
WHERE  
    dim_book_star.genre = 'novel'
GROUP BY
    dim_store_star.state;
	
	
	
SELECT 
    dim_state_sf.state, 
    SUM(sales_amount)
FROM 
    fact_booksales
JOIN dim_book_sf 
    ON fact_booksales.book_id = dim_book_sf.book_id
JOIN dim_genre_sf 
    ON dim_book_sf.genre_id = dim_genre_sf.genre_id
JOIN dim_store_sf
    ON fact_booksales.store_id = dim_store_sf.store_id 
JOIN dim_city_sf 
    ON dim_store_sf.city_id = dim_city_sf.city_id
JOIN dim_state_sf
    ON  dim_city_sf.state_id = dim_state_sf.state_id
WHERE  
    dim_genre_sf.genre = 'novel'
GROUP BY
    dim_state_sf.state;
	
	

SELECT 
    * 
FROM dim_store_star
WHERE country != 'USA' 
    AND country !='CA';



