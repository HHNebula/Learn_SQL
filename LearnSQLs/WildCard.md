# 와일드카드 활용하기

보통의 쿼리문은 정확하게 작성하여 원하는 값을 검색한다.  
그러나 검색할 대상을 정확히 알지 못해 원하는 대상을 일부만 검색하는 경우가 발생할 수 있다.  
이런 경우 와일드 카드를 사용하여 지정한 패턴과 일치하는 값을 검색할 수 있다.

```sql
-- LIKE 문 기본 형식
SELECT [Column] FROM [Table] WHERE [Column] LIKE [Condition]
```

- `Column` : 조건을 적용할 열 이름을 입력한다.
- `LIKE` : 데이터를 가져올 패턴을 정하는 구문
- `Condition` : 데이터를 가져올 패턴

---

### 특정 문자열을 포함 혹은 포함하지 않는 문자열 검색하기

`LIKE의 사용방법`
- `LIKE` : 뒤의 패턴을 포함하는 데이터
- `NOT LIKE` : 뒤의 패턴을 포함하지 않는 데이터

`%의 사용 방법`
- `A%` : A로 시작하는 모든 문자열
- `%A` : A로 끝나는 모든 문자열
- `%A%` : A를 포함하는 모든 문자열

```sql

-- LIKE : 포함하는 --

-- A로 시작하는 모든 문자열 검색
SELECT City FROM Cities
WHERE City LIKE 'A%'

-- A로 끝나는 모든 문자열 검색
SELECT City FROM Cities
WHERE Country LIKE '`%A`'

-- A를 포함하는 모든 문자열 검색
SELECT City FROM Cities
WHERE Country LIKE '%A%'

-- NOT LIKE : 포함하지 않는 --

-- A로 시작하지 않는 모든 문자열 검색
SELECT City FROM Cities
WHERE City NOT LIKE 'A%'

-- A로 끝나지 않는 모든 문자열 검색
SELECT City FROM Cities
WHERE Country NOT LIKE '%A'

-- A를 포함하지 않는 모든 문자열 검색
SELECT City FROM Cities
WHERE Country NOT LIKE '%A%'
```

---

### 특수 문자를 포함한 문자열 검색하기

만일 검색하고자 하는 패턴에 특수문자 `%` 가 포함된 경우,  
`%` 는 예약어 이므로 `LIKE %%%` 와 같은 형식으로는 검색할 수 없다.  

이런 경우 아래와 같은 문법으로 `ESCAPE` 를 사용하여야 한다.

```sql
-- ESCAPE 기본 문법
SELECT [Column] FROM [Table]
WHERE [Column] LIKE [Condition] ESCAPE [Condition]
```


```sql
LIKE %#%% ESCAPE '#'
```
`ESCAPE` 에 사용할 문자를 `#` 으로 지정할 경우,  
`LIKE` 의 조건인 `%#%%` 에서 `#` 이 제외되어  
실제 실행시에는 `%%%` 으로 해석되며 `%` 을 포함하는 모든 데이터가 검색된다.

`ESCAPE` 에 사용될 문자는 다른 것도 가능하다.  
다만 실제 데이터에는 입력되지 않은 문자여야 의도치 않은 오류를 방지할 수 있다.

---

### 특정 문자와 특정 길이의 문자열 검색하기

`%` 는 포함 관계이므로 포함만 된다면 어떤 문자열이던 검색하며  
문자열의 길이까지 지정할 경우 `%` 대신 `_` 을 사용한다.
문자열의 길이는 `_` 의 개수로 지정한다.

`_의 사용 방법`
- `A_` : A로 시작하면서 뒤의 글자는 무엇이던 상관 없는 2글자 문자열
- `_A` : A로 끝나면서 앞의 글자는 무엇이던 상관 없는 2글자 문자열
- `_A_` : 3글자 중 가운데 글자가 A이고 앞뒤의 글자는 무엇이던 상관 없는 문자열
- `A__L` : A로 시작하며 L로 끝나며 가운데 글자는 무엇이던 상관 없는 4글자 문자열

```sql
SELECT * FROM nasdaq_company
WHERE symbol Like 'A_'
-- 심볼이 A로 시작하며 2글자인 나스닥 회사 검색

SELECT * FROM products
WHERE product_name LIKE A______L
-- 상품명이 A로 시작하여 L로 끝나며 8글자인 상품 검색
```

---

### _ 과 % 동시에 사용하기

두 와일드 카드를 조합하여 여러 규칙을 만들어낼 수 있다.

```sql
SELECT * FROM Customers
WHERE Country LIKE '_U%';
-- 두 번째 글자가 U 인 Country 검색

SELECT * FROM Customers
WHERE Country LIKE 'U__%';
-- 첫 번째 글자가 U 이며 3글자 이상인 Country 검색
```

---

### 문자나 문자 범위를 지정해 문자열 검색하기

`%` 과 `_` 는 모든 문자열에 대해 적용된다.  
`[]` 을 사용한다면 검색할 문자열의 대상을 좁혀줄 수 있다.

`_의 사용 방법`
- `[A, B, C]%` : A 또는 B 또는 C로 시작하는 모든 문자열
- `[A-G]%` : A ~ G로 시작하는 모든 문자열

```sql
SELECT * FROM nasdaq_company
WHERE symbol LIKE 'A[A,B,C]'
-- symbol이 A로 시작하며 A, B, C 중 한가지로 끝나는 2글자 문자열 검색

SELECT * FROM nasdaq_company
WHERE symbol LIKE 'A[A,B,C]%'
-- symbol이 A로 시작하며 두 번째 글자는 A, B, C 중 한가지인 모든 문자열 검색

SELECT * FROM nasdaq_company
WHERE symbol LIKE 'A[A-Y]'
-- symbol이 A로 시작하며 A ~ Y 중 한가지로 끝나는 2글자 문자열 검색

SELECT * FROM nasdaq_company
WHERE symbol LIKE 'A__[A-E]%'
-- symbol이 A로 시작하며 네 번째 글자는 A ~ E 중 한가지인 모든 문자열 검색
```

---

### 문자나 문자 범위를 제외한 문자열 검색하기

`_` 와 `%` 는 `LIKE` 대신 `NOT LIKE` 를 사용하여야 하나  
`[]` 의 경우에는 `NOT` 이 아닌 `^` 를 사용한다.

```sql
SELECT * FROM nasdaq_company
WHERE symbol LIKE 'A[^A-Y]'
-- symbol이 A로 시작하며 A ~ Y 로 끝나지 않는 2글자 문자열 검색

SELECT * FROM nasdaq_company
WHERE symbol LIKE 'A__[^A-E]%'
-- symbol이 A로 시작하며 네 번째 글자는 A ~ E 가 아닌 모든 문자열 검색
```

---

### Quiz
- Customers 테이블에서 Country 가 A ~ D로 시작하며  
마지막 2번째 글자가 g ~ z가 아닌 데이터  
[answer](/QuerySQLs/WildCard_Quiz_1.sql)
- Customers 테이블에서 Country 가 A~D로 시작하지 않으며  
a~d로 끝나는 7글자 이상인 데이터  
[answer](/QuerySQLs/WildCard_Quiz_2.sql)