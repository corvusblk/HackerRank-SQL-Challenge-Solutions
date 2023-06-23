SELECT IF(grades.grade >= 8, students.name, 'NULL'),
       grades.grade,
       students.marks
FROM   students
JOIN   grades
       ON  grades.min_mark <= students.marks
       AND grades.max_mark >= students.marks
ORDER  BY grades.grade DESC,
          students.name ASC;
