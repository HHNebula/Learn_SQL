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