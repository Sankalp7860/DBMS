-- Q1 
SELECT roll_no,
       score,
       CASE
           WHEN score < 40 THEN 'F'
           WHEN score >= 40 AND score < 60 THEN 'C'
           WHEN score >= 60 AND score < 80 THEN 'B'
           WHEN score >= 80 THEN 'A'
       END AS grade
FROM marks;

-- Q2 
SELECT GRADE, COUNT(*) FROM (
	SELECT roll_no,
       score,
       CASE
           WHEN score < 40 THEN 'F'
           WHEN score >= 40 AND score < 60 THEN 'C'
           WHEN score >= 60 AND score < 80 THEN 'B'
           WHEN score >= 80 THEN 'A'
       END AS grade
FROM marks ) AS GRADES_TABLE GROUP BY GRADE;