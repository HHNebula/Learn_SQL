-- Products 테이블에서 CategoryID 그룹별로 등록된 ProductName 개수를 출력하시오.

SELECT CategoryID, COUNT(ProductName) AS Count_Product
FROM Products
GROUP BY CategoryID;