-- Customers 테이블에서 Country 가 A~D로 시작하며  
-- 마지막 2번째 글자가 g~z가 아닌 데이터 

SELECT * FROM Customers
WHERE Country LIKE '[A-D]%[^g-z]_'