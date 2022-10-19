-- Users 테이블에서 Year_of_subscription 컬럼이 2022년인 데이터 중에  
-- Work 컬럼이 Developer 혹은 Programmer 인 데이터를 검색해서  
-- Name 오름차순으로 정렬한 후  
-- 101번째 데이터부터 20개의 데이터를 출력하세요.

SELECT *
FROM Users
WHERE Work
IN ( 'Developer', 'Programmer' )
AND Year_of_subscription = 2022
ORDER BY Name
OFFSET 100 ROWS
FETCH NEXT 20 ROWS ONLY
