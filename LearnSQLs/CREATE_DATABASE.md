# 데이터베이스 / 테이블 생성 및 삭제하기

DB와 테이블을 생성하는 옵션은 매우 복잡하지만 간단히 필수적인 요소만 다루도록 한다.  
ERD 관련 툴을 사용하면 간단히 쿼리문으로 변환하여 적용할 수 있다.

---

### 데이터베이스 생성하기

데이터베이스를 생성하려면 `CREATE` 문을 사용한다.  
데이터베이스 제조사마다 `CREATE` 문에 제공하는 옵션이 다를 수 있다.

```sql
CREATE DATABASE [DATABASE NAME];
```

원하는 데이터베이스의 이름을 기재하여 쿼리를 실행한다.  
실행 후 DBMS 에서 데이터베이스의 목록에 바로 보이지 않을 경우  
새로고침하여 새로 생성된 데이터베이스를 확인한다.

---

### 데이터베이스 삭제하기

데이터베이스를 삭제하려면 `DROP` 문을 사용한다.  

```sql
DROP DATABASE [DATABASE NAME];
```

쿼리가 실행되었지만 목록에 그대로 노출될 경우 역시 새로고침하여 확인한다.  

---

### 테이블 생성하기

테이블을 생성하는 옵션은 매우 복잡하지만 간단히 필수적인 요소만 다루도록 한다.  

```sql
CREATE TABLE [TableName] (
    [Column1] [Type1] [NULL_Restriction],
    [Column2] [Type1] [NULL_Restriction],
    [Column3] [Type1] [NULL_Restriction]
);
```
- `TableName` : 생성할 테이블 이름을 입력한다.
- `Column` : 생성할 컬럼명을 입력한다.
- `TYPE` : 담을 데이터의 자료형을 설정한다.
- `NULL_Restriction` : NULL 값 허용 여부를 설정한다.

---

### 테이블 삭제하기

테이블을 삭제할 때에도 `DROP` 문을 이용하여 삭제한다.  
다만 삭제하고자 하는 테이블이 자손 테이블일 경우  
종속관계에 있는 조상 테이블을 먼저 삭제하여야 한다.

```sql
DROP TABLE [TableName];
```