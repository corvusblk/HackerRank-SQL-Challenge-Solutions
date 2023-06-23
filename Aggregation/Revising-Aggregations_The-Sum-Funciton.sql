SELECT SUM(population) AS california_pop
FROM   city
WHERE  district = 'California'
GROUP  BY district;