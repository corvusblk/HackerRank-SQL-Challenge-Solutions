SELECT ROUND(
           MAX(lat_N) - MIN(lat_n)
           + MAX(long_w) - MIN(long_w)
           , 4) AS manhat_dist
FROM station;