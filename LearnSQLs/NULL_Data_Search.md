# NULL 데이터 검색

`NULL` 은 데이터가 없는 상태를 말한다.  
숫자형 자료에서의 `0` 혹은 문자형 자료에서 ` ` 와 같이 공백 등이 아니라

> NULL 이란 아예 정의되지 않은 값을 말한다.

아래 사진은 다음의 코드를 실행한 결과 중 일부이다.
```sql
SELECT * FROM nasdaq_company
```
<img src = ../imgs/null_data.png>

`sector` 와 `industry` 열을 확인해보자.  
`NULL` 로 표시된 값과 값이 들어있지 않은 공백을 확인할 수 있다.
공백으로 표시되는 경우 데이터로 ` ` 공백이 들어있는 상태이며,
값 자체가 존재하지 않는 `NULL` 과 다르다.

---

### NULL 필터링

```sql
SELECT * FROM nasdaq_company
WHERE sector = NULL;
```
위 SQL 문은 `sector` 가 `NULL` 인 데이터를 검색하는 것처럼 보이지만  
`NULL` 은 정의되지 않은 상태이므로 일반적인 연산자로 비교할 수 없다.
따라서 `NULL` 은 `IS NULL` 또는 `IS NOT NULL` 을 사용하여 필터링을 한다.

```sql
SELECT * FROM nasdaq_company
WHERE sector IS NULL;
-- sector 컬럼이 NULL 인 데이터를 검색

SELECT * FROM nasdaq_company
WHERE sector IS NOT NULL;
-- sector 컬럼이 NULL 이 아닌 데이터를 검색
```