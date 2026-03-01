
SELECT
	stay,
	count (*) count_int,
	round(AVG(todep),2) AS average_phq,
	round(AVG(tosc),2) AS average_scs,
	round(AVG(toas),2) AS average_as
FROM
	public.students
WHERE 
	inter_dom LIKE 'Inter'
GROUP BY stay
ORDER BY stay desc;
