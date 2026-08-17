-- 1. Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on someday if they made at least one activity on that day.

SELECT 
    activity_date  AS day,
    COUNT(distinct user_id) AS active_users
FROM Activity 
WHERE activity_type IN('open_session','end_session','scroll_down','send_message')
and (activity_date>='2019-06-28' AND activity_date<='2019-07-27')
GROUP BY activity_date ;



-- 2. Write a solution to find all the authors that viewed at least one of their own articles.
   -- Return the result table sorted by id in ascending order.
   
SELECT distinct author_id AS id
FROM views 
WHERE author_id=viewer_id
ORDER BY author_id;



-- 3. We define query quality as:
	-- The average of the ratio between query rating and its position.
	-- We also define poor query percentage as:
	-- The percentage of all queries with rating less than 3.
	-- Write a solution to find each query_name, the quality and poor_query_percentage.
	-- Both quality and poor_query_percentage should be rounded to 2 decimal places.

SELECT
    query_name,
    ROUND(AVG(rating * 1.0 / position), 2) AS quality,
    ROUND(
        SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*),
        2
    ) AS poor_query_percentage
FROM Queries
GROUP BY query_name;
