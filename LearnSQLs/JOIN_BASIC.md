# 복수의 테이블에서 쿼리를 작성하기

서로 다른 테이블의 `Column` 을 함께 표시할 때 사용하는 것이 `JOIN` 이다.  
`JOIN` 은 테이블 A 와 B 의 정보를 포함해 검색할 수 있다.

처음부터 데이터를 합쳐서 테이블을 만드는 방법도 있겠지만  
데이터가 중복으로 저장되는 경우도 있을 것이다.

---

### INNER JOIN

<div align="center">
<img src = ../imgs/img_innerjoin.png>
</div>
</br>

`JOIN` 은 상황에 따라 여러 종류로 구분해 사용한다.

`INNER JOIN` 은 가장 널리 쓰이는 기본적인 `JOIN` 이며,  
`JOIN KEY` 에 해당하는 각 테이블의 `Column` 값을 비교해 조건에 맞는 값을 검색한다.

아래 쿼리는 `INNER JOIN` 의 기본적인 형태이다.

```sql
SELECT [Column(s)]
FROM [Table1] INNER JOIN [Table2]
ON [Table1.Column] = [Table2.Column]
WHERE [Condition]
```

---

### INNER JOUN 예제

`CategoryID` 가 5 또는 6인 `ProductName` 과 그 상품의 `SupplierName` 을 표시한다.

`ProductName` 은 `Products` 테이블에 저장되어 있으며,  
`SupplierName` 은 `Suppliers` 테이블에 저장되어 있다.

`Products` 와 `Suppliers` 두 테이블은 `SupplierID` 가 `PK / FK` 로 연결되어 있다.

|Products|Suppliers|
|---|---|
|ProductID|SupplierID|
|ProductName|SupplierName|
|SupplierID|ContactName|
|CategoryID|Address|
|Unit|City|
|Price|PostalCode|
||Country|
||Phone|

위 예제를 바탕으로 작성된 쿼리문은 아래와 같다.

```sql
SELECT Products.ProductName, Suppliers.SupplierName
FROM Products INNER JOIN Suppliers
ON Products.SupplierID = Suppliers.SupplierID
WHERE Products.CategoryID IN ( 5, 6 )
```

- `SELECT` : 검색하여 표시할 테이터 값을 입력한다.  
여기서는 `[Table].[Column]` 을 입력하여 어떤 테이블의 어떤 컬림인지를 명확하게 한다.
- `FROM [Table] INNER JOIN [Table]` : `JOIN` 할 테이블을 뒤에 입력한다.  
여기서는 `ProductName` 을 기반으로 `SupplierName` 을 찾기 위해 `Suppliers` 을 입력하였다.
- `ON` : 조인의 조건을 작성한다.  
`WHERE` 과 비슷한 기능을 하지만 `ON` 은 조인의 조건으로만 작용한다.  
여기서는 두 테이블 간 `SupplierID` 가 동일한 데이터만 병합하는 조건으로 작용한다.
- `WHERE` : 여기서는 병합이 완료된 데이터를 필터링 하는 조건으로 작용한다.

---

### 3개 이상의 Table JOIN

3개 이상의 테이블을 조인할 경우 두 테이블의 관계가 다대다인 경우가 많다.  
우선 3개 이상의 `INNER JOIN` 기본 형식은 아래와 같다.

```sql
SELECT [Column(s)]
FROM [Table1]
INNER JOIN [Table2] ON [Table1.Column] = [Table2.Column]
INNER JOIN [Table3] ON [Table2.Column] = [Table3.Column]
WHERE [Condition]
```

이렇게 `Table1` 에 `Table2` 를 `JOIN` 하여  
`Table1` 과 `Table2` 간 조인 조건을 통해 병합한 결과에  
`Table3` 또 다시 `JOIN` 하여 `Table2` 와 `Table3` 간 조인 조건으로 병합한다.

간단하게 A 에서 C 라는 테이블 사이 B 라는 테이블이 위치해 있으므로  
연결 선을 따라서 쭉쭉 이어나간다고 보면 될 것이다.

---

### Quiz

|Users|Auths|Authorizations|
|---|---|---|
|UserID|AuthID|UserID|
|Name|Name|AuthID|
|Email|||

최 상단은 각 테이블 명을, 그 밑으로는 컬럼명으로 구성된 표이다.  
UserID 와 AuthID 는 Primary Key 이며 Authorizations 테이블은 Foreign Key 로 구성되어 있다.

사용자명이 Teddy 혹은 Allen 인 User의 Name과 Email, 그리고 보유한 Auths의 Name명을 검색하시오.

[answer](../QuerySQLs/INNER_JOIN_Quiz.sql)