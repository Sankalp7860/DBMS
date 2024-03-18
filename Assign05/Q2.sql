

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