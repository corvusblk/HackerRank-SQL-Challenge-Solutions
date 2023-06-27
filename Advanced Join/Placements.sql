WITH salary_comparison AS(
    SELECT name,
           p1.salary AS personal_salary,
           p2.salary AS friend_salary
    FROM   students AS s
    JOIN   friends USING(id)
    JOIN   packages AS p1 USING(id)
    JOIN   packages AS p2
           ON p2.id = friend_id
)
SELECT name
FROM   salary_comparison
WHERE  personal_salary < friend_salary
ORDER  BY friend_salary;