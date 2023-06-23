SELECT CASE WHEN a + b + c <= 2 * GREATEST(a,b,c)
                THEN 'Not A Triangle'
            WHEN a = b AND b = c
                THEN 'Equilateral'
            WHEN a = b OR b = c OR c = a
                THEN 'Isosceles'
            ELSE 'Scalene'
            END
FROM triangles;