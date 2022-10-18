# SELECT 문으로 데이터 검색하기

### 특정 열 검색하기

```sql
SELECT [컬럼] FROM [테이블]
```
- `SELECT` : 데이터를 검색하는 구문
- `[컬럼]` : 검색하려는 데이터의 열, 다수의 열은 쉼표로 구분, 모든 열은 *
- `FROM` : 데이터를 가져올 테이블을 정하는 구문
- `[테이블]` : 데이터가 저장된 테이블 명

```sql
SELECT symbol FROM nasdaq_company
```
> nasdaq_company 테이블에서 symbol 컬럼을 모두 가져온다.

#

### 여러 개의 열 검색하기
```sql
SELECT symbol, company_name FROM nasdaq_company
```
> nasdaq_company 테이블에서 symbol, company_name 컬럼을 모두 가져온다.  
> 컬럼명 사이에 쉼표를 넣어 구분한다.

#

### 전체 열 검색하기
```sql
SELECT * FROM nasdaq_company
```
> nasdaq_company 테이블의 모든 컬럼을 가져온다.  
> 컬럼명 대신 *를 넣어 구분한다.

#

### SSMS 에서 테이블의 열 정보 확인하기
```sql
EXEC sp_columns @table_name = N'nasdaq_company', @table_owner = N'dbo';
```
> `SQL Server` 에서만 사용할 수 있는 시스템 함수

#

### Quiz
- nasdaq_company 테이블에서 sector, industry 열만 검색하세요.  
[Answer](../QuerySQLs/SELECT_Quiz_1.sql)
- nasdaq_company 테이블에서 symbol, close_price 열만 검색하세요.  
[Answer](../QuerySQLs/SELECT_Quiz_2.sql)