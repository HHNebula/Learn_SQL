-- Customers 테이블에서 Country 가 A~D로 시작하지 않으며
-- a~d로 끝나는 7글자 이상인 데이터

SELECT * FROM Customers
WHERE Country LIKE '[A-D]%_____[a-d]';

SELECT * FROM Customers
WHERE Country LIKE '[A-D]_____%[a-d]';