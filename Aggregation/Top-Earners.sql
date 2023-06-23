SELECT months * salary AS earnings,
       count(*)
FROM   employee
GROUP  BY earnings
ORDER  BY earnings DESC
LIMIT  1;