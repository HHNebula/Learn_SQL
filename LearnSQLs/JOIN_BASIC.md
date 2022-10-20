# 복수의 테이블에서 쿼리를 작성하기

서로 다른 테이블의 `Column` 을 함께 표시할 때 사용하는 것이 `JOIN` 이다.  
`JOIN` 은 테이블 A 와 B 의 정보를 포함해 검색할 수 있다.  
처음부터 데이터를 합쳐서 테이블을 만드는 방법도 있겠지만 데이터가 중복으로 저장되는 경우도 있을 것이며 데이터 수정 작업이 굉장히 번거로울 것이다.

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
SELECT [Column] FROM [Table1]
INNER JOIN [Table2] ON [Table1.Column] = [Table2.Column]
WHERE [Condition]
```




```SQL
SELECT Products.ProductName, Suppliers.SupplierName
FROM Products INNER JOIN Suppliers
ON Products.SupplierID = Suppliers.SupplierID
WHERE Products.CategoryID IN ( 5, 6 )
```