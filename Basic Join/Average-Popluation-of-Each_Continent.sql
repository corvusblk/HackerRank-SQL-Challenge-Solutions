SELECT country.continent,
       FLOOR(AVG(city.population))
FROM   city
JOIN   country
       ON country.code = city.countrycode
GROUP BY country.continent;