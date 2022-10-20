-- Customers 테이블에서 Country 그룹별 고객의 수가 5명 이상인 국가를
-- 고객의 숫자가 많은 순으로 출력하시오.

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;