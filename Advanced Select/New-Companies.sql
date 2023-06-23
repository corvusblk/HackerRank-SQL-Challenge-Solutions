SELECT emp.company_code,
       MIN(cmp.founder),
       COUNT(DISTINCT lead_manager_code),
       COUNT(DISTINCT senior_manager_code),
       COUNT(DISTINCT manager_code),
       COUNT(DISTINCT employee_code)
FROM   employee AS emp
RIGHT  JOIN company AS cmp
       ON cmp.company_code = emp.company_code
GROUP  BY company_code
ORDER  BY company_code ASC;