WITH projects_begin AS(
    SELECT start_date,
           ROW_NUMBER() OVER(ORDER BY start_date) AS row_num
    FROM   projects
    WHERE  start_date NOT IN(SELECT end_date FROM projects)
),
projects_end AS(
    SELECT end_date,
           ROW_NUMBER() OVER(ORDER BY end_date) AS row_num
    FROM   projects
    WHERE  end_date NOT IN(SELECT start_date FROM projects)
)
SELECT start_date,
       end_date
FROM   projects_begin AS pb
JOIN   projects_end AS pe
       USING(row_num)
ORDER  BY end_date - start_date,
       start_date;