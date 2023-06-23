WITH parents
    AS( SELECT p
        FROM bst
        WHERE p IS NOT null)

SELECT n,
       CASE WHEN p IS NULL THEN 'Root'
            WHEN n NOT IN (SELECT p FROM parents) THEN 'Leaf'
            ELSE 'Inner'
            END AS node_class
FROM   bst
ORDER  BY n;