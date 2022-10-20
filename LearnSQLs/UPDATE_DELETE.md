# 데이터 수정 및 삭제하기

### UPDATE 문으로 삽입된 데이터 수정하기

아래 쿼리는 기존의 데이터를 수정하는 기본 `UPDATE` 문이다.

```sql
UPDATE [TableName] SET Column1 = VALUE1, Column2 = VALUE2 ...
WHERE [Coulumn] = [Condition];
```

`WHERE` 문의 조건이 없다면 지정한 컬럼의 데이터를 전부 바꾸기 때문에  
반드시 `WHERE` 문을 사용하여 조건을 정확히 설정해야 한다.  

아래 쿼리문은 회원정보를 수정하는 예시이다.

```sql
UPDATE Users SET UserName = 'Erin', UserEmail = 'Ireland@Ireland.is'
WHERE UserID = 5;
```

위 쿼리에서 `WHERE` 문을 제외한다면 모든 데이터가 동일한 값으로 수정될 것이다.

---

### DELETE 문으로 데이터 삭제하기

아래 쿼리는 입력되어있느 데이터를 삭제하는 `DELETE` 문이다.

```sql
DELETE [Table] WHERE [Column] = [Condition]
```

`UPDATE` 와 마찬가지로 `WHERE` 문의 조건이 누락되면  
모든 데이터가 삭제되므로 조건을 정확히 작성해야 한다.

---

### Foreign Key로 연결된 데이터 입력 및 삭제

관계형 데이터베이스는 데이터의 무결성을 유지해야 하므로  
조상 테이블에 없는 자료를 자손 테이블이 가질 수 없다.

따라서 자손 테이블에 데이터를 입력할 때에는  
반드시 조상 테이블에 먼저 데이터를 입력해야 하며

조상 테이블의 데이터를 삭제할 때에는  
반드시 자손 테이블에서 먼저 데이터를 삭제해야 한다.