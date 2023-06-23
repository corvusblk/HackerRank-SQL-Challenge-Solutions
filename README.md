# HackerRank SQL Challenges
These are all my SQL query solutions to the challenges found on [HackerRank SQL Challenges](https://www.hackerrank.com/domains/sql)

I've chosen to adopt certain "best-practices" for SQL formatting
* UPPERCASE keywords
* snake_case ids (or camelCase when no '_' separators)
* first line of query section (`SELECT, FROM`, etc.) in line but aligned to position of `SELECT` section
e.g.
```
SELECT price
FROM   catalog
WHERE  price > 100;
```
* `AS` always used for clarity of distinction
* multiple values per query section placed on newlines unless single line is subjectively clean e.g.
`SELECT quantity, value, date` snubbed in favor of
```
SELECT quantity,
          value,
          date
```
