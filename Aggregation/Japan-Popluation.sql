SELECT SUM(population) AS japan_pop
FROM   city
WHERE  countrycode = 'JPN'
GROUP  BY countrycode;