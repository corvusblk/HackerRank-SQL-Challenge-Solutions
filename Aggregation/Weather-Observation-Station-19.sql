SELECT ROUND(SQRT(POWER(b - a, 2) + POWER(c - d, 2)), 4)
FROM(  SELECT
           MIN(lat_n) AS a,
           MAX(lat_n) AS b,
           MIN(long_w) AS c,
           MAX(long_w) AS d
       FROM station) AS sub;