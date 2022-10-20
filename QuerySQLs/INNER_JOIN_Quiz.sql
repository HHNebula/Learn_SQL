-- 사용자명이 Teddy 혹은 Allen 인 User의 Name과 Email, 그리고 보유한 Auths의 Name명을 검색하시오.

SELECT Users.Name, Users.Email, Auths.Name
FROM Users
INNER JOIN Authorizations ON Users.UserID = Authorizations.UserID
INNER JOIN Auths ON Authorizations.AuthID = Auths.AuthID
WHERE Users.Name IN ( 'Teddy', 'Allen' );