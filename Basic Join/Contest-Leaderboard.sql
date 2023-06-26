WITH max_submission_scores
AS(  SELECT hacker_id,
            name,
            challenge_id,
            MAX(score) AS score
     FROM   Hackers
     JOIN   Submissions
            USING(hacker_id)
     GROUP  BY hacker_id, name, challenge_id
     ORDER  BY hacker_id
)
SELECT hacker_id,
       name,
       SUM(score)
FROM   max_submission_scores
GROUP  BY hacker_id, name
HAVING SUM(score) > 0
ORDER  BY SUM(score) DESC,
       hacker_id ASC;