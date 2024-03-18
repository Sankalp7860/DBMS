show databases;
use Assignment3;

CREATE TABLE marks (
    roll_no INT PRIMARY KEY,
    score INT
);


INSERT INTO marks (roll_no, score) VALUES
(1, 75),
(2, 55),
(3, 90),
(4, 30),
(5, 68);

SELECT * FROM MARKS;

-- Qa 

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

-- Qb 

-- Q1 
SELECT * FROM CUSTOMERS AS C , ORDERS AS O WHERE (C.C_NUM=O.C_NUM) AND (AMT>5000 AND (SELECT YEAR(O.ORDER_DATE)=2024));

-- Q2 
SELECT * FROM CUSTOMERS WHERE C_NUM NOT IN (SELECT DISTINCT C_NUM FROM ORDERS);

-- Q3 
SELECT C_NAME, CITY
FROM CUSTOMERS
WHERE RATING = (SELECT RATING FROM CUSTOMERS WHERE C_NAME = 'Hoffman');

-- Q4 
SELECT S_NUM , SUM(AMT) FROM ORDERS GROUP BY S_NUM HAVING SUM(AMT)>(SELECT MAX(AMT) FROM ORDERS);