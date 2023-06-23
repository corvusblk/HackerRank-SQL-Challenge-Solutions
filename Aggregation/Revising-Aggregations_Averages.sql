SELECT AVG(population) AS avg_california_pop
FROM   city
WHERE  district = "California"
GROUP  BY district;