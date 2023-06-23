SELECT s.hacker_id,
       h.name
FROM   submissions AS s
JOIN   hackers AS h
       ON h.hacker_id = s.hacker_id
JOIN   challenges AS c
       ON c.challenge_id = s.challenge_id
JOIN   difficulty AS d
       ON d.difficulty_level = c.difficulty_level
WHERE  s.score = d.score
GROUP  BY s.hacker_id, h.name
HAVING COUNT(h.name) > 1
ORDER  BY COUNT(h.name) DESC,
       s.hacker_id ASC