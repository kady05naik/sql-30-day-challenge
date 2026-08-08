-- 1. Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. Round your answer to  decimal places.

SELECT 
    ROUND(long_w,4)
FROM station
WHERE lat_n > 38.7780
ORDER BY lat_n
LIMIT 1;



-- 2. Consider P1(a, b) and P2(c, d) to be two points on a 2D plane.a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).b happens to equal the minimum value in Western Longitude (LONG_W in STATION).c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).d happens to equal the maximum value in Western Longitude (LONG_W in STATION).Query the Manhattan Distance between points P1 and P2 and round it to a scale of 4 decimal places.

SELECT ROUND((MAX(lat_n)-MIN(lat_n)) + (MAX(long_w)-MIN(long_w)),4)
FROM station;



-- 3. Consider P1(a, c) and P2(b, d) to be two points on a 2D plane where (a, b) are the respective minimum and maximum values of Northern Latitude (LAT_N) and (c, d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.Query the Euclidean Distance between points P1 and P2 and format your answer to display 4 decimal digits.

SELECT 
    ROUND(
        sqrt(
            POW(MAX(Lat_n)-MIN(Lat_n),2) + POW(MAX(long_w)-MIN(long_w),2)
        ),
    4)
FROM station;



-- 4. A median is defined as a number separating the higher half of a data set from the lower half. Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to 4 decimal places.

WITH cte_latn_rn AS (
    SELECT
        ROUND(lat_n,4) AS lat,
        row_number() OVER (ORDER BY lat_n DESC) AS rn,
        COUNT(*) OVER () AS cnt
    FROM station
)
SELECT ROUND(AVG(lat),4)
FROM cte_latn_rn
WHERE rn BETWEEN cnt/2 AND cnt/2+1;



-- 5. Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT c.name
FROM city c
JOIN country con
    ON c.countrycode=con.code
WHERE lower(continent) ='africa';



-- 6. Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.
-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT 
    coun.continent,
    FlOOR(AVG(c.population))   
FROM city c
JOIN country coun
    ON c.countrycode=coun.code
GROUP BY coun.continent;    