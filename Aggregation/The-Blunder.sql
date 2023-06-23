SELECT CEILING(
           AVG(salary) -
           AVG(REPLACE( salary, '0', ''))
       ) AS error_value
FROM   employees
WHERE  salary > 1000
       AND salary < 100000;