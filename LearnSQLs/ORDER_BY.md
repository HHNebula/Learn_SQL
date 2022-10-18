# ORDER BY 문으로 데이터 정렬하기

데이터 정렬은 `ORDER BY` 로 진행하며,  
`SELECT` 문의 가장 마지막에 추가해 사용한다.

```sql
-- ORDER BY 문의 기본 형식
SELECT [Column]
FROM [Table]
WHERE [Column] [Operator] [Condition]
ORDER BY [Column] [ASC, DESC]
```
- ORDER BY [Column] [ASC, DESC]  
[Column] : 정렬할 컬럼명을 기입  
[ASC, DESC] : 정렬 기준  ASC = 오름차순, DESC = 내림차순

---

### 1개 Column 기준으로 정렬하기

데이터를 하나의 컬럼 기준으로 정렬할 때는
> 정렬할 컬럼명을 ORDER BY 문 뒤에 입력한다.  

```sql
-- City 를 기준으로 데이터 오름차순 정렬
SELECT * FROM Customers
ORDER BY City
```

<img src = ../imgs/ORDER_BY_One_Column.png>

City 컬럼을 기준으로 A 부터 오름차순으로 정렬되었다.  
내림차순으로 정렬할 경우 다음과 같이 작성한다.

```sql
-- City 를 기준으로 데이터 내림차순 정렬
SELECT * FROM Customers
ORDER BY City DESC
```

---

### 2개 Column 기준으로 정렬하기

2개 이상의 컬럼을 기준으로 정렬할 때는 정렬 순서에 따라 쉼표를 사용한다.  
입력 순서에 따라 정렬의 우선순위가 정해지므로 열 입력 순서에 주의해야 한다.

```sql
SELECT ContactName, Country, City
FROM Customers
ORDER BY Country, City
```

이렇게 하면 먼저 Country 를 기준으로 정렬한 다음,  
같은 Country 값을 가진 City 를 정렬한다.

<img src = ../imgs/ORDER_BY_Sort_by_2_or_more.png>

정렬 순서를 바꾸어 입력하면 정렬 순서가 다르므로 결과도 다르다.

```sql
SELECT ContactName, Country, City
FROM Customers
ORDER BY City, Country
```

<img src = ../imgs/ORDER_BY_Sort_by_2_or_more_rev.png>

---

### 오름차순 / 내림차순 정렬하기 (ASC / DESC)

오름차순 정렬은 `ASC` 를 정렬하려는 컬럼명 뒤에 붙인다.  
정렬 기본값이 오름차순이므로 `ASC` 는 생략이 가능하다.

```sql
SELECT ProductName FROM Products
ORDER BY ProductName ASC

SELECT ProductName FROM Products
ORDER BY ProductName
```

내림차순 정렬은 `DESC` 를 정렬하려는 컬럼명 뒤에 붙인다.  
정렬 기본값이 오름차순이므로 `DESC` 는 생략이 불가능하다.

```sql
SELECT ProductName FROM Products
ORDER BY ProductName DESC
```

---

### 오름차순과 내림차순을 조합해 정렬하기

오름차순과 내림차순을 각 컬럼명 뒤에 다르게 조합하여 정렬할 수 있다.  
아래 쿼리문은 `Price` 을 내림차순으로 1차 정렬을 한 뒤,  
같은 `Price` 값을 가진 `ProductName` 을 오름차순으로 재정렬한다.


```sql
SELECT ProductName, Price FROM Products
ORDER BY Price DESC, ProductName ASC
```

---

### TOP N 으로 상위 N개 데이터 검색하기

특정 조건으로 정렬한 데이터 중 상위 N개의 데이터만 확인할 경우
`SELECT TOP 10 [Column] FROM ...` 과 같은 방식으로  
검색하고자 하는 로우의 수를 추가해 사용할 수 있다,

> MySQL 의 경우 문장의 맨 마지막에 LIMIT [Num]

```sql
SELECT TOP 10 ProductName, Price FROM Products
ORDER BY Price DESC, ProductName ASC
```

`TOP` 은 테이블에 어떤 데이터가 어떻게 저장되어있는지 등  
데이터를 가볍게 확인하는 용도로 사용하기 적합하다.

---

### OFFSET ... FETCH NEXT

이 기능은 게시판 등에서 검색 기능을 통해 ( 또는 통하지 않아도 )  
정렬된 게시글을 페이지로 나누어 구간별로 조회해야하는 기능에 적합하다.  

`OFFSET` 은 검색한 결과에서 지정한 행 개수만큼 건너 뛴 다음 출력한다.  
아래는 `OFFSET` 의 기본 문법이며 입력한 `Number` 만큼 건너뛴 후 출력한다.

```sql
SELECT [Column]
FROM [Table]
ORDER BY [Column]
OFFSET [Number] ROWS;

SELECT Title
FROM Contents
ORDER BY Created_date
OFFSET 20 ROWS;
```

게시판 처럼 일정 개수만큼 보여줄 경우  
아래 SQL문과 같이 `FETCH NEXT` 문을 추가한다.

```sql
SELECT Title
FROM Contents
ORDER BY Created_date
OFFSET 20 ROWS -- 20개를 건너 뛴 다음
FETCH NEXT 20 ROWS ONLY -- 20만 보여준다
```

---

### Quiz
- Users 테이블에서 Year_of_subscription 컬럼이 2022년인 데이터 중에  
Work 컬럼이 Developer 혹은 Programmer인 데이터를 검색해서  
Name 오름차순으로 정렬한 후  
101번째 데이터부터 20개의 데이터를 출력하세요.  
[answer](../QuerySQLs/ORDER_BY_Quiz_1.sql)