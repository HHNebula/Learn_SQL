# 데이터 삽입하기

### INSERT 문으로 테이블에 데이터 삽입하기

아래 쿼리는 테이블에 데이터를 삽입하는 기본 `INSERT` 문이다.

```sql
INSERT INTO [TableName] ( Column1, Column2, Column3 ... )
VALUES ( VALUE1, VALUE2, VALUE3 ... );
```

데이터를 삽입하기 위해서는 당연히 테이블이 있어야 한다.  
아래 `CREATE` 문으로 `Users` 테이블을 생성한 뒤  
사용자의 데이터 3개를 삽입하는 쿼리이다.

```sql
CREATE TABLE Users (
    UserID INT(10) NOT NULL COMMENT '회원번호',
    UserName VARCHAR(200) NOT NULL COMMENT '사용자명',
    UserEmail VARCHAR(200) NULL COMMENT '이메일'
);

INSERT INTO Users ( UserID, UserName, UserEmail )
VALUES ( 1, 'Aaron', 'tomato10@us.com' ),
( 2, 'Abraham', 'doti@hardwork.net' ),
( 3, 'Aaliyah', 'ohhora@orora.com' );

SELECT * FROM Users; -- 데이터 확인
```

`INSERT` 문에 작성한 `Column` 의 순서대로  
`VALUES` 에 실제 데이터를 삭정해주어야 하며  
`,` 을 이용하여 동시에 여러 데이터를 삽입할 수 있다.

데이터 삽입 시 `INSERT` 문 뒤의 삽입할 컬럼명을 생략할 수 있다.  
다만, `VALUES` 문에 전체 컬럼의 개수와 일치하지 않는 경우 에러가 발생한다.

```sql
INSERT INTO Users
VALUES ( 4, 'Brittany', 'British@UK.com' );

SELECT * FROM Users; -- 데이터 확인
```

물론 전체가 아닌 원하는 `Column` 만 데이터를 삽입할 수 있다.  
`INSERT` 문에 삽입하기를 원하는 `Column` 만 작성하면 된다.

```sql
INSERT INTO Users ( UserID, UserName )
VALUES ( 5, 'Courtney' );
```

이 경우 해당 인스턴스의 `UserEmail` 컬럼 값은 `NULL` 이 된다.