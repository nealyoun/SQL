# String_Functions

## MySQL 문자열 함수

- LENGTH(문자열)
    - 문자열에 할당된 byte 수를 반환

```sql
SELECT LENGTH('MySQL')
		 , LENGTH('마이에스큐엘');
```

![Screen Shot 2022-04-04 at 9.47.56 AM.png](String_Fun%208b055/Screen_Shot_2022-04-04_at_9.47.56_AM.png)

- BIT_LENGTH(문자열)
    - 문자열의 bit 크기를 반환
    - DB 인코딩 설정이 UTF-8로 되어 있는 경우, 영어는 한글자에 1byte, 한글은 한글자에 3byte
    - 1byte = 8bit

```sql
SELECT BIT_LENGTH('MySQL')
		 , BIT_LENGTH('마이에스큐엘');
```

![Screen Shot 2022-04-04 at 9.48.34 AM.png](String_Fun%208b055/Screen_Shot_2022-04-04_at_9.48.34_AM.png)

- CHAR_LENGTH(문자열)
    - 문자열의 개수를 반환

```sql
SELECT CHAR_LENGTH('MySQL')
		 , CHAR_LENGTH('마이에스큐엘');
```

![Screen Shot 2022-04-04 at 9.47.02 AM.png](String_Fun%208b055/Screen_Shot_2022-04-04_at_9.47.02_AM.png)

- CONCAT(문자열1, 문자열2, ...)

```sql
SELECT CONCAT('A', 'B', 'C');
```

![Screen Shot 2022-04-04 at 9.58.50 AM.png](String_Fun%208b055/Screen_Shot_2022-04-04_at_9.58.50_AM.png)

- CONCAT_WS(구분자, 문자열1, 문자열2, ...)
    - 구분자로 구분하며 문자열 병합

```sql
SELECT CONCAT_WS('/', 'A', 'B', 'C');
```

![Screen Shot 2022-04-04 at 9.58.38 AM.png](String_Fun%208b055/Screen_Shot_2022-04-04_at_9.58.38_AM.png)

- ELT(n, 문자열1, 문자열2, ...)
    - 여러 문자열 중 n 번째에 해당하는 문자열 반환

```sql
SELECT ELT(2, 'AB', 'ABCD', 'ABC');
```

![Screen Shot 2022-04-04 at 10.03.55 AM.png](String_Fun%208b055/Screen_Shot_2022-04-04_at_10.03.55_AM.png)

- FIELD(찾고자 하는 문자열, 문자열1, 문자열2, ...)
    - 여러 문자열 중 찾고자 하는 문자열이 있다면 몇 번째인지 위치를 반환, 없는 경우 0을 반환

```sql
SELECT FIELD('B', 'A', 'B', 'AB', 'C');
```

![Screen Shot 2022-04-04 at 10.05.24 AM.png](String_Fun%208b055/Screen_Shot_2022-04-04_at_10.05.24_AM.png)

- FIND_IN_SET(찾고자 하는 문자열, 콤마로 구분된 문자열)
    - 콤마로 구분된 문자열 내에서 찾고자 하는 문자열이 있다면 몇 번째인지 위치를 반환, 없는 경우 0을 반환

```sql
SELECT FIND_IN_SET('C', 'A,B,C,AB,AC');
```

![Screen Shot 2022-04-04 at 10.08.30 AM.png](String_Fun%208b055/Screen_Shot_2022-04-04_at_10.08.30_AM.png)

- INSTR(기준 문자열, 부분 문자열)
    - 기준 문자열 내에서 부분 문자열의 시작 위치를 반환, 부분 문자열이 기준 문자열 내에 없으면 0을 반환

```sql
SELECT INSTR('MySQL Studies', 'SQL');
```

![Screen Shot 2022-04-04 at 10.22.09 AM.png](String_Fun%208b055/Screen_Shot_2022-04-04_at_10.22.09_AM.png)

- LOCATE(부분 문자열, 기준 문자열)
    - INSTR과 기능 동일, 매개변수 순서만 다름
    - 기준 문자열 내에서 부분 문자열의 시작 위치를 반환, 부분 문자열이 기준 문자열 내에 없으면 0을 반환

```sql
SELECT LOCATE('SQL', 'MySQL Studies');
```

![Screen Shot 2022-04-04 at 10.22.36 AM.png](String_Fun%208b055/Screen_Shot_2022-04-04_at_10.22.36_AM.png)

- ASCII

문자를 ascii 코드로 변환, ascii 코드에 해당되는 문자를 반환

- CHAR(97)의 경우 Workbench 버그로 인해 ‘BLOB’로 나옴

```sql
SELECT ASCII('A')
		 , ASCII('a')
     , CHAR(97)
     , CAST(CHAR(97) as CHAR(1));
```

![Screen Shot 2022-04-04 at 9.42.09 AM.png](String_Fun%208b055/Screen_Shot_2022-04-04_at_9.42.09_AM.png)

- INSERT(문자열1, n1, n2, 문자열2)
    - 문자열1 내에서 n1 번째 문자부터 n2 번째 문자까지 삭제 후 새로운 문자열2 추가

```sql
SELECT INSERT('Oracle query', 1, 6, 'MySQL');
```

![Screen Shot 2022-04-04 at 11.01.29 AM.png](String_Fun%208b055/Screen_Shot_2022-04-04_at_11.01.29_AM.png)

- LEFT(문자열, n)
    - 왼쪽을 기준으로 문자열을 n 번째 문자까지만 반환

```sql
SELECT LEFT('MySQL Studies', 5);
```

![Screen Shot 2022-04-04 at 11.06.57 AM.png](String_Fun%208b055/Screen_Shot_2022-04-04_at_11.06.57_AM.png)

- RIGHT(문자열, n)
    - 오른쪽을 기준으로 문자열을 n 번째 문자까지만 반환

```sql
SELECT RIGHT('MySQL Studies', 7);
```

![Screen Shot 2022-04-04 at 11.08.10 AM.png](String_Fun%208b055/Screen_Shot_2022-04-04_at_11.08.10_AM.png)

- UPPER(문자열), UCASE(문자열)
    - 문자열내에 소문자를 대문자로 반환

```sql
SELECT UCASE('mysql');
```

![Screen Shot 2022-04-05 at 8.34.59 AM.png](String_Fun%208b055/Screen_Shot_2022-04-05_at_8.34.59_AM.png)

- LOWER(문자열), LCASE(문자열)
    - 문자열내에 대문자를 소문자로 반환

```sql
SELECT LCASE('MYSQL');
```

![Screen Shot 2022-04-05 at 8.36.23 AM.png](String_Fun%208b055/Screen_Shot_2022-04-05_at_8.36.23_AM.png)

- LPAD(문자열1, n, 문자열2)
    - 문자열2를 (n - 문자열1) 만큼 왼쪽에 채워 반환
    - SQL 길이: 3, n: 5, (5-3) 만큼 ‘*’를 왼쪽에 채움

```sql
SELECT LPAD('SQL', 5, '*')
```

![Screen Shot 2022-04-05 at 8.41.16 AM.png](String_Fun%208b055/Screen_Shot_2022-04-05_at_8.41.16_AM.png)

- RPAD(문자열1, n, 문자열2)
    - 문자열2를 (n - 문자열1) 만큼 오른쪽애 채워 반환

```sql
SELECT RPAD('SQL', 5, '*')
```

![Screen Shot 2022-04-05 at 8.50.45 AM.png](String_Fun%208b055/Screen_Shot_2022-04-05_at_8.50.45_AM.png)

- TRIM(문자열), TRIM(방향 [rmstr] FROM 문자열)
    - 문자열의 앞뒤 공백을 제거하여 반환
    - TRIM 사용시 공백 이외의 다른 문자도 제거 가능
    - 방향으로 문자열 앞, 혹은 뒤쪽만 선택하여 제거 가능
        - LEADING: 좌측 공백 혹은 문자 제거
        - TRAILING: 우측 공백 혹은 문자 제거
        - BOTH: 죄우 공백 혹은 문자 제거 (default)
        - rmstr 생략시 공백 제거
    

```sql
SELECT TRIM('       MySQL       ');
```

![Screen Shot 2022-04-05 at 8.58.24 AM.png](String_Fun%208b055/Screen_Shot_2022-04-05_at_8.58.24_AM.png)

```sql
SELECT TRIM(LEADING FROM '       MySQL       ');
```

![Screen Shot 2022-04-05 at 9.07.40 AM.png](String_Fun%208b055/Screen_Shot_2022-04-05_at_9.07.40_AM.png)

```sql
SELECT TRIM(LEADING '*' FROM '*****MySQL*****');
```

![Screen Shot 2022-04-05 at 9.08.51 AM.png](String_Fun%208b055/Screen_Shot_2022-04-05_at_9.08.51_AM.png)

- LTRIM(문자열)
    - 문자열의 왼쪽 공백을 제거하여 반환

```sql
SELECT LTRIM('       MySQL       ');
```

![Screen Shot 2022-04-05 at 9.10.15 AM.png](String_Fun%208b055/Screen_Shot_2022-04-05_at_9.10.15_AM.png)

- RTRIM(문자열)
    - 문자열의 오른쪽 공백을 제거하여 반환

```sql
SELECT RTRIM('       MySQL       ');
```

![Screen Shot 2022-04-05 at 9.10.56 AM.png](String_Fun%208b055/Screen_Shot_2022-04-05_at_9.10.56_AM.png)

- REPLACE(문자열, str1, str2)
    - 문자열내에서 str1을 찾아 str2로 대체하여 반환
    - TRIM()으로 할 수 없었던 문자열 내부 공백을 찾아 제거 가능

```sql
SELECT REPLACE('Oracle query', 'Oracle', 'MySQL')
```

![Screen Shot 2022-04-05 at 9.22.51 AM.png](String_Fun%208b055/Screen_Shot_2022-04-05_at_9.22.51_AM.png)

```sql
SELECT REPLACE('  My S Q L  ', ' ', '');
```

![Screen Shot 2022-04-05 at 9.25.22 AM.png](String_Fun%208b055/Screen_Shot_2022-04-05_at_9.25.22_AM.png)

- REPEAT(문자열, n)
    - 문자열을 n 번 만큼 반복하여 반환

```sql
SELECT REPEAT('SQL', 5)
```

![Screen Shot 2022-04-05 at 9.29.50 AM.png](String_Fun%208b055/Screen_Shot_2022-04-05_at_9.29.50_AM.png)

- REVERSE(문자열)
    - 문자열의 순서를 거꾸로 뒤집어 반환

```sql
SELECT REVERSE('MySQL');
```

![Screen Shot 2022-04-05 at 9.31.21 AM.png](String_Fun%208b055/Screen_Shot_2022-04-05_at_9.31.21_AM.png)

- SPACE(n)
    - n 길이 만큼의 공백을 반환

```sql
SELECT CONCAT('MySQL', SPACE(10), 'query');
```

![Screen Shot 2022-04-05 at 9.33.03 AM.png](String_Fun%208b055/Screen_Shot_2022-04-05_at_9.33.03_AM.png)

- SUBSTR(문자열, n1, n2), SUBSTRING(문자열, n1, n2), MID(문자열, n1, n2)
    - 문자열의 n1의 위치에서 시작해 n2 길이 만큼 잘라낸 결과를 반환
    - n1을 0으로 명시하면 1이 적용
    - n1이 음수이면 문자열 오른쪽 끝에서부터 거꾸로 세어 가져옴
    - n2를 생략하면 n1부터 문자열 끝까지 반환

```sql
SELECT SUBSTR('ABCDEFG', 3, 2);
```

![Screen Shot 2022-04-05 at 9.46.19 AM.png](String_Fun%208b055/Screen_Shot_2022-04-05_at_9.46.19_AM.png)

- SUBSTRING_INDEX(문자열, str, n)
    - 문자열을 str(구분자) 기준으로 나눈 후 n(구분자 index) 번째 str 부터 등장하는 문자는 제거하고 반환
    - n 이 음수일 경우 문자열의 오른쪽을 시작으로 str의 순서를 매김

```sql
-- 문자열을 ','로 구분
-- 두 번째 ',' 이후의 문자는 제거하고 반환
SELECT SUBSTRING_INDEX('MySQL,ORACLE,MSSQL', ',', 2);
```

![Screen Shot 2022-04-05 at 10.02.00 AM.png](String_Fun%208b055/Screen_Shot_2022-04-05_at_10.02.00_AM.png)

```sql
SELECT SUBSTRING_INDEX('MySQL,ORACLE,MSSQL', ',', -1);
```

![Screen Shot 2022-04-05 at 10.07.09 AM.png](String_Fun%208b055/Screen_Shot_2022-04-05_at_10.07.09_AM.png)

- REGEXP_REPLACE(문자열, 정규 표현식, str)
    - 정규식을 통해 영문, 한글, 숫자, 특수문자를 제거
    - 문자열 내에서 해당 정규 표현식을 str로 대체하여 반환

```sql
-- 영문 제거
SELECT REGEXP_REPLACE('ab12cd한글(테스트)','[a-z]','');
```

![Screen Shot 2022-04-05 at 10.15.35 AM.png](String_Fun%208b055/Screen_Shot_2022-04-05_at_10.15.35_AM.png)

```sql
-- 한글 제거
SELECT REGEXP_REPLACE('ab12cd한글(테스트)','[가-힣]','');
```

![Screen Shot 2022-04-05 at 10.14.18 AM.png](String_Fun%208b055/Screen_Shot_2022-04-05_at_10.14.18_AM.png)

```sql
-- 숫자 제거
SELECT REGEXP_REPLACE('ab12cd한글(테스트)','[0-9]','');
```

![Screen Shot 2022-04-05 at 10.15.23 AM.png](String_Fun%208b055/Screen_Shot_2022-04-05_at_10.15.23_AM.png)

```sql
-- 특수문자 '()' 와 한글 제거
SELECT REGEXP_REPLACE('ab12cd한글(테스트)','[가-힣()]','');
```

![Screen Shot 2022-04-05 at 10.16.42 AM.png](String_Fun%208b055/Screen_Shot_2022-04-05_at_10.16.42_AM.png)