# 그룹화 데이터 다루기

데이터를 검색할 때 공통 그룹의 정보를 확인해야할 경우가 있다.  
그룹의 특정 조건을 필터링하여 해당 그룹의 정보만 검색하는 경우도 있다.  
이런 경우 데이터를 그룹화하기 위해 `GROUP BY` 문을 사용한다.
그룹을 필터링할 때는 `HAVING` 문을 사용한다.

```sql
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
HAVING condition
ORDER BY column_name(s);
```

- `GROUP BY` : 데이터를 그룹화하는 구문
- `Column_name(s)` : 그룹화 기준 컬럼을 작성 ( 1개 이상 가능 )
- `HAVING` : 그룹화된 결과를 필터링하는 구문 ( `WHERE` 과 유사 )
- `Condition` : `HAVING` 필터에 적용할 조건값을 입력한다.

`HAVING` 문은 적지 않을 수 있으며 `ORDER BY` 를 적지 않을 경우 오름차순으로 정렬된다.

---

### GROUP BY 문으로 그룹화 하기

`GROUP BY` 문은 지정한 컬럼의 데이터를 그룹화한다.  
아래 쿼리는 `Country` , `City` 를 기준으로 데이터를 그룹화한 것이다.

```sql
SELECT Country, City
FROM Customers
GROUP BY Country, City;
```

그룹화 순서는 작성한 순서를 따라간다.  
`Country` 를 먼저 그룹화 한 후 `City` 를 그룹화한 결과를 출력한다.
생략된 `ORDER BY` 로 오름차순으로 정렬된 결과가 표현된다.

|Country|City|
|---|---|
|Argentina|Buenos Aires|
|Austria|Graz|
|Austria|Salzburg|
|Belgium|Bruxelles|
|Belgium|Charleroi|
|Brazil|Campinas|
|Brazil|Resende|
|...|...|

---

### Column 내 데이터 개수 확인하기

특정 열을 기준으로 그룹화 하여 그 그룹 내의 데이터 개수를 확인할 수 있다.
이 경우 `SELECT` 문 뒤에 `COUNT` 함수를 사용한다.

아래의 쿼리는 `Country` 기준으로 데이터를 그룹화 한 뒤  
각 컬럼값 내 `City` 의 데이터 개수를 반환한다.

```sql
SELECT Country, COUNT(City)
FROM Customers
GROUP BY Country;
```

|Country|COUNT(City)|
|---|---|
|Argentina|3|
|Austria|2|
|Belgium|2|
|...|...|

쿼리에 입력된 `COUNT(City)` 가 그대로 칼럼명이 된다.  
만일 칼럼명을 바꾸고 싶다면 다음과 `AS` 을 사용한다.  
`AS` 문은 `SELECT` 문 바로 뒤의 모든 `Column` 에 사용이 가능하다.

단 이렇게 생성된 칼럼명은 별칭이므로 출력시에만 반영되므로  
쿼리 작성 시 컬럼명 대신 별칭을 적을 경우 오류가 발생된다.

```sql
SELECT Country, COUNT(City) AS City_Count
FROM Customers
GROUP BY Country;
```

컬럼명이 `City_Count` 로 출력되는 결과를 확인할 수 있다.

|Country|City_Count|
|---|---|
|Argentina|3|
|Austria|2|
|Belgium|2|
|...|...|

아래 쿼리는 `ORDER BY` 문으로 정렬한 케이스이다.  
그룹의 행 개수를 구하여 그 개수가 많은 순서대로 데이터를 정렬하여 반환한다.

```sql
SELECT Country, COUNT(City) AS City_Count
FROM Customers
GROUP BY Country
ORDER BY COUNT(City)  DESC;
```
|Country|City_Count|
|---|---|
|USA|13|
|Germany|11|
|France|11|
|...|...|

---

### 그룹화된 데이터 필터링하기

위 내용처럼 그룹화된 데이터를 `HAVING` 문으로 필터링한다.
`WHERE` 문과 비슷하지만 `HAVING` 은 그룹화된 컬럼에만 사용할 수 있다.

아래 쿼리는 `Country` , `City` 를 그룹화 한 뒤  
`Country` 가 `USA` 인 데이터만 출력한다.

```sql
SELECT Country, City FROM Customers
GROUP BY Country, City
HAVING Country = 'USA';
```

아래 `WHERE` 문을 사용하여 필터링 한 결과와 동일하게 느껴지나  
데이터를 정렬하고 중복을 제거하였으므로 출력 결과는 차이가 있다.

```sql
SELECT Country, City FROM Customers
WHERE Country = 'USA';
```

---

### 데이터의 개수로 필터링하기

`COUNT` 문을 사용하여 데이터의 개수를 구한 뒤  
`HAVING` 문으로 특정 조건을 설정하여 필터링할 수 있다.

아래 쿼리는 각 `Country` 에 포함된 `City` 수가 5 이상인 경우  
그 데이터만 결과를 출력하여 반환한다.

```sql
SELECT Country, COUNT(City) AS City_Count
FROM Customers
GROUP BY Country
HAVING COUNT(City) >= 5
ORDER BY COUNT(City) ASC; -- ASC는 생략 가능
```

|Country|City_Count|
|---|---|
|Mexico|5|
|Spain|5|
|UK|7|
|...|...|

---

### 중복된 데이터 제거하기

중복 제거는 `GROUP BY` 문을 사용하여 그룹화 할 경우  
그룹 내 중복값은 존재할 수 없으므로 자동으로 제거된다.

만일 `GROUP BY` 를 사용하지 않고 중복을 제거하고 싶을 경우  
`DISTINCT` 문을 사용하여 제거한다.

```sql
SELECT DISTINCT Country
FROM Customers
```
위 쿼리문은 `Country` 를 기준으로 중복값을 제거하므로  
`Country` 만 같다면 다른 컬럼이 달라도 중복 값으로 제거한다.

아래의 쿼리는 `City` 까지 2개를 기준으로 중복값을 제거하므로  
`Country` 가 같아도 `City` 가 다르다면 제거하지 않는다.

```sql
SELECT DISTINCT Country, City
FROM Customers
```

`GROUP BY` 처럼 중복을 제거한다고 해서 동일하진 않다.  
`DISTINCT` 는 단순히 중복을 제거할 뿐이므로 집계 또는 계산을 할 수 없다.

---

### Quiz
- Products 테이블에서 CategoryID 그룹별로 등록된 ProductName 개수를 출력하시오.  
[answer](../QuerySQLs/GROUP_BY_Quiz_1.sql)
- Customers 테이블에서 Country 그룹별 고객의 수가 5명 이상인 국가를  
고객의 숫자가 많은 순으로 출력하시오.  
[answer](../QuerySQLs/GROUP_BY_Quiz_2.sql)