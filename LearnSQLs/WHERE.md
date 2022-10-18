# WHERE 문으로 조건에 맞는 데이터 검색하기

### 특정 값 검색하기

```sql
SELECT [컬럼] FROM [테이블] WHERE [컬럼] = [조건값]
```
- `WHERE` : 조건을 적용하는 구문
- `[컬럼]` : 조건을 적용할 열을 입력
- `=` : 조건을 적용할 연산자 종류를 입력
- `[테이블]` : 조건값 입력

```sql
SELECT * FROM nasdaq_company WHERE symbol = 'MSFT'
```
> nasdaq_company 테이블에서 symbol 이 'MSFT' 인 인스턴스를 가져온다.

#

### 비교 연산자 종류

|연산자|설명|
|---|---|
|<|필터링 조건보다 작은 값을 검색 (미만)|
|<=|필터링 조건보다 작거나 같은 값을 검색 (이하)|
|=|필터링 조건과 같은 값을 검색|
|>=|필터링 조건보다 크거나 같은 값을 검색 (이상)|
|>|필터링 조건보다 큰 값을 검색 (초과)|
|<>, !=|필터링 조건과 같지 않은 값을 검색|
|!<|필터링 조건보다 작지 않은 값을 검색|
|!>|필터링 조건보다 크지 않은 값을 검색|

숫자는 물론 문자에도 연산자를 사용할 수 있지만,  
데이터베이스 시스템이 정의한 정렬 기준에 따라 결과가 달라지므로  
데이터 속성에 따라 연산자를 적절히 사용해야 한다.

#

### 비교 연산자 사용하기

```sql
-- ipo_year가 2021년인 행을 검색
SELECT * FROM nasdaq_company
WHERE ipo_year = 2011

-- ipo_year가 2021년 미만인 행을 검색
SELECT * FROM nasdaq_company
WHERE ipo_year < 2011

-- symbol이 MSFT인 행을 검색
SELECT * FROM nasdaq_company
WHERE symbol = 'MSFT'

-- symbol이 MSFT 초과인 행을 검색
SELECT * FROM nasdaq_company
WHERE symbol > 'MSFT'

-- last_crawel_date가 2021년 10원 14일인 행을 검색
SELECT * FROM nasdaq_company
WHERE last_crawel_date = '2021-10-14'

-- last_crawel_date가 2021년 10원 14일과 다른 행을 검색
SELECT * FROM nasdaq_company
WHERE last_crawel_date != '2021-10-14'
```

#

### WHERE 문에서 논리 연산자 사용하기

논리 연산자는 참과 거짓만을 판단하므로 복잡한 조건은 논리 연산자를 활용한다.

|연산자|설명|
|---|---|
|ALL|모든 비교 집합이 TRUE 이면 TRUE|
|AND|두 부울 표현식이 모두 TURE 이면 TRUE|
|ANY|비교 집합 중 하나라도 TRUE 이면 TRUE|
|BETWEEN|피연산자가 범위내에 있으면 TRUE|
|EXISTS|하위 쿼리에 행이 포함되면 TRUE|
|IN|피연산자가 리스트 중 하나라도 포함되면 TRUE|
|LIKE|피연산자가 패턴과 일치하면 TURE|
|NOT|부울 연산자를 반대로 실행|
|OR|하나의 부울식이 TRUE 이면 TRUE|
|SOME|비교 집합 중 일부가 TURE 이면 TRUE|

#