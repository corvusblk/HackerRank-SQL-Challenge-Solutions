/* CTEs */
WITH challenge_counts
AS(  SELECT COUNT(hacker_id) AS count
            FROM   challenges AS c
            GROUP  BY hacker_id
),
distinct_challenge_counts
AS(  SELECT count
     FROM   challenge_counts
     GROUP  BY count
     HAVING COUNT(count) = 1
)

/* Query */
SELECT c.hacker_id,
       MIN(h.name),
       COUNT(c.hacker_id)
FROM   challenges AS c
JOIN   hackers AS h
       ON h.hacker_id = c.hacker_id
GROUP  BY c.hacker_id
HAVING COUNT(c.hacker_id) = (SELECT MAX(count) FROM challenge_counts)
       OR COUNT(c.hacker_id) IN (SELECT * FROM distinct_challenge_counts)
ORDER  BY COUNT(c.hacker_id) DESC,
       c.hacker_id