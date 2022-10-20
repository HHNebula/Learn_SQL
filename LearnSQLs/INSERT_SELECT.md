# 검색 결과를 다른 테이블에 옮기기

특정 조건으로 검색한 데이터를 다른 테이블에 입력할 경우  
`INSERT SELECT` 문을 사용하며 아래 쿼리는 기본 형식이다.

```sql
INSERT [DestinationTable]
SELECT [Column] FROM [DepartureTable]
```

- `DestinationTable` : 추출한 데이터를 저장할 테이블
- `DepartureTable` : 데이터를 추출할 테이블

---

### 다른 테이블에 검색 결과 입력하기

아래 쿼리는 `Users` 테이블에서 데이터를 추출하며  
`Certified` 컬럼값이 `True` 인 `User(s)` 를 `CertifiedUsers` 에 입력한다.

```sql
INSERT CertifiedUsers
SELECT * FROM Users
WHERE Certified = 'True'
```

---

### 테이블을 새로 만들어 검색 결과 입력하기

기존의 테이블이 아닌 새로운 테이블을 생성하여 데이터를 저장할 수 있다.  
이 경우에는 `SELECT INTO` 문을 사용하며 아래 쿼리는 기본 형식이다.

```sql
SELECT [Column] INTO [NewTable]
FROM [DepartureTable]
```

- `NewTable` : 새로 생성할 테이블 명

아래 쿼리는 `Users` 테이블에서 데이터를 추출하며  
`Certified` 컬럼값이 `True` 인 `User(s)` 를  
`CertifiedUsers` 테이블을 새로 생성하여 해당 테이블에 입력한다.

```sql
SELECT * INTO CertifiedUsers
FROM Users
WHERE Certified = 'True'
```

추출한 데이터를 사용하였다면 삭제 쿼리도 잊지말자.