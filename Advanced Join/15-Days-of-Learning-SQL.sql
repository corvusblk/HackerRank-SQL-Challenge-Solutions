WITH unique_submissions AS(
    SELECT RANK() OVER (
               PARTITION BY submission_date
               ORDER BY COUNT(hacker_id) DESC, hacker_id) AS rank,
           submission_date,
           hacker_id,
           COUNT(hacker_id) AS count,
           CASE WHEN (DATEDIFF(DAY, '2016-03-01', submission_date) + 1)
                = (COUNT(*) OVER (PARTITION BY hacker_id ORDER BY submission_date))
                THEN 1 ELSE 0
                END AS sequential
    FROM   submissions
    GROUP  BY submission_date, hacker_id
),
max_submissions AS(
    SELECT submission_date AS submission_date,
           s1.hacker_id,
           name
    FROM   unique_submissions AS s1
    JOIN   hackers AS s2 ON s2.hacker_id = s1.hacker_id
    WHERE  rank = 1
),
sequential_submissions AS(
    SELECT MIN(submission_date) AS submission_date,
           COUNT(hacker_id) AS count
    FROM   unique_submissions
    WHERE  sequential = 1
    GROUP  BY submission_date
)
SELECT s1.submission_date,
       count,
       hacker_id,
       name
FROM   max_submissions AS s1
JOIN   sequential_submissions AS s2
       ON s2.submission_date = s1.submission_date;