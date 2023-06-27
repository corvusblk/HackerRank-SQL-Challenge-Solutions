WITH summed_submission_stats AS(
    SELECT challenge_id,
           SUM(total_submissions) AS total_submissions,
           SUM(total_accepted_submissions) AS total_accepted_submissions
    FROM   submission_stats
    GROUP  BY challenge_id
),
summed_view_stats AS(
    SELECT challenge_id,
           SUM(total_views) AS total_views,
           SUM(total_unique_views) AS total_unique_views
    FROM   view_stats
    GROUP  BY challenge_id
)
SELECT MIN(contest_id),
       MIN(hacker_id),
       MIN(name),
       SUM(total_submissions),
       SUM(total_accepted_submissions),
       SUM(total_views),
       SUM(total_unique_views)
FROM   contests
INNER  JOIN colleges
       USING(contest_id)
RIGHT  JOIN challenges
       USING(college_id)
LEFT   JOIN summed_submission_stats
       USING(challenge_id)
LEFT   JOIN summed_view_stats
       USING(challenge_id)
GROUP  BY contest_id
ORDER  BY contest_id;