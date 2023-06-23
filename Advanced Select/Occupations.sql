SET @r1=0, @r2=0, @r3=0, @r4=0;

SELECT MIN(doctor),
       MIN(professor),
       MIN(singer),
       MIN(actor)
FROM(
    SELECT CASE WHEN occupation = 'Doctor' THEN @r1:=@r1+1
                WHEN occupation = 'Professor' THEN @r2:=@r2+1
                WHEN occupation = 'Singer' THEN @r3:=@r3+1
                WHEN occupation = 'Actor' THEN @r4:=@r4+1
                END AS row_num,
           CASE WHEN occupation = 'Doctor' THEN name END AS doctor,
           CASE WHEN occupation = 'Professor' THEN name END AS professor,
           CASE WHEN occupation = 'Singer' THEN name END AS singer,
           CASE WHEN occupation = 'Actor' THEN name END AS actor
    FROM   occupations
    ORDER  BY name
) AS temp
GROUP BY row_num;