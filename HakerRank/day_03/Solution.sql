-- 1. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY 
FROM STATION 
WHERE CITY NOT REGEXP '^[aeiouAEIOU]' 
   OR CITY NOT REGEXP '[aeiouAEIOU]$';



-- 2. Query the difference between the maximum and minimum populations in CITY.

SELECT MAX(population)- MIN(population)
FROM city ; 



-- 3. Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table: 

-- Equilateral: It's a triangle with 3 sides of equal length.
-- Isosceles: It's a triangle with 2 sides of equal length.
-- Scalene: It's a triangle with 3 sides of differing lengths.
-- Not A Triangle: The given values of A, B, and C don't form a triangle.

SELECT 
    CASE 
        WHEN (a+b)<=c OR (b+c)<=a OR (a+c)<=b THEN 'Not A Triangle'
        WHEN a=b and b=c  THEN 'Equilateral'
        WHEN a=b OR b=c OR c=a THEN 'Isosceles'
    ELSE
        'Scalene'
    END  AS traingle_type
FROM triangles;



-- 4. Generate the following two result sets:
-- A. Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S). Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:
-- B. There are a total of [occupation_count] [occupation]s.where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.
-- Note: There will be at least two entries in the table for each type of occupation.

SELECT concat(name, '(' , substring(occupation,1,1) , ')') As reult
FROM  occupations  
UNION
SELECT concat('There are a total of ', count(occupation), ' ',  lower(occupation),'s.') As reult
from occupations
GROUP BY occupation
ORDER BY reult;



-- 5. Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.
-- Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.

SELECT ceil(AVG(salary) - AVG(replace (salary,0,'')))
FROM employees;



-- 6. Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's 0 key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.Write a query calculating the amount of error (i.e.: \(actual - miscalculated\) average monthly salaries), and round it up to the next integer.

SELECT 
    (months*salary)  As earnings,
    count(*)
FROM employee
WHERE (months*salary) IN (SELECT MAX(months*salary) FROM employee)
GROUP BY (months*salary) ;



-- 7. Query the following two values from the STATION table:
-- The sum of all values in LAT_N rounded to a scale of 2 decimal places.
-- The sum of all values in LONG_W rounded to a scale of 2 decimal places.

SELECT 
    ROUND(SUM(lat_n),2) AS lat,
    ROUND(SUM(long_w),2) AS lon
FROM station;



-- 8. Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than 38.7880 and less than 137.2345. Truncate your answer to 4 decimal places.

SELECT ROUND(SUM(lat_n),4)
FROM station
WHERE lat_n > 38.7880 AND lat_n<137.2345;



-- 9. Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. Truncate your answer to 4 decimal places.

SELECT 
	ROUND(MAX(LAT_N),4)
FROM station
WHERE lat_n < 137.2345;



-- 10.  Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION that is less than 137.2345. Round your answer to 4 decimal places.

SELECT 
    ROUND(long_w,4)
FROM station
WHERE lat_n < 137.2345
ORDER BY lat_n DESC
LIMIT 1;