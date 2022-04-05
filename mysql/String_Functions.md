# String_Functions

## MySQL 문자열 함수

- LENGTH(문자열)
    - 문자열에 할당된 byte 수를 반환

```sql
SELECT LENGTH('MySQL')
		 , LENGTH('마이에스큐엘');
```

![Screen_Shot_2022-04-04_at_9 47 56_AM](https://user-images.githubusercontent.com/54128055/161659544-ba9b3cf0-0a67-4c76-975a-c2258907b90d.png)
<br/><br/><br/>
- BIT_LENGTH(문자열)
    - 문자열의 bit 크기를 반환
    - DB 인코딩 설정이 UTF-8로 되어 있는 경우, 영어는 한글자에 1byte, 한글은 한글자에 3byte
    - 1byte = 8bit

```sql
SELECT BIT_LENGTH('MySQL')
		 , BIT_LENGTH('마이에스큐엘');
```

![Screen_Shot_2022-04-04_at_9 48 34_AM](https://user-images.githubusercontent.com/54128055/161659551-081cf29b-650d-41f2-a0d4-2c193a257d3e.png)
<br/><br/><br/>
- CHAR_LENGTH(문자열)
    - 문자열의 개수를 반환

```sql
SELECT CHAR_LENGTH('MySQL')
		 , CHAR_LENGTH('마이에스큐엘');
```

![Screen_Shot_2022-04-04_at_9 47 02_AM](https://user-images.githubusercontent.com/54128055/161659542-d3c2a1c3-5237-4b3c-b4f1-50bf809be974.png)
<br/><br/><br/>
- CONCAT(문자열1, 문자열2, ...)

```sql
SELECT CONCAT('A', 'B', 'C');
```

![Screen_Shot_2022-04-04_at_9 58 50_AM](https://user-images.githubusercontent.com/54128055/161659561-a3cded4d-f582-47eb-91df-61893f15bcee.png)
<br/><br/>
- CONCAT_WS(구분자, 문자열1, 문자열2, ...)
    - 구분자로 구분하며 문자열 병합

```sql
SELECT CONCAT_WS('/', 'A', 'B', 'C');
```

![Screen_Shot_2022-04-04_at_9 58 38_AM](https://user-images.githubusercontent.com/54128055/161659557-c78fc841-d49f-453b-9f6b-0f10c20c53f1.png)
<br/><br/><br/>
- ELT(n, 문자열1, 문자열2, ...)
    - 여러 문자열 중 n 번째에 해당하는 문자열 반환

```sql
SELECT ELT(2, 'AB', 'ABCD', 'ABC');
```

![Screen_Shot_2022-04-04_at_10 03 55_AM](https://user-images.githubusercontent.com/54128055/161659564-a9710bbf-7deb-473e-a347-7692734c0bc1.png)
<br/><br/><br/>
- FIELD(찾고자 하는 문자열, 문자열1, 문자열2, ...)
    - 여러 문자열 중 찾고자 하는 문자열이 있다면 몇 번째인지 위치를 반환, 없는 경우 0을 반환

```sql
SELECT FIELD('B', 'A', 'B', 'AB', 'C');
```

![Screen_Shot_2022-04-04_at_10 05 24_AM](https://user-images.githubusercontent.com/54128055/161659570-0ce627f2-b4b6-40c2-8875-308004e0562d.png)
<br/><br/><br/>
- FIND_IN_SET(찾고자 하는 문자열, 콤마로 구분된 문자열)
    - 콤마로 구분된 문자열 내에서 찾고자 하는 문자열이 있다면 몇 번째인지 위치를 반환, 없는 경우 0을 반환

```sql
SELECT FIND_IN_SET('C', 'A,B,C,AB,AC');
```

![Screen_Shot_2022-04-04_at_10 08 30_AM](https://user-images.githubusercontent.com/54128055/161659576-d64ab27e-82b7-47cf-8136-f0d989b1b334.png)
<br/><br/><br/>
- INSTR(기준 문자열, 부분 문자열)
    - 기준 문자열 내에서 부분 문자열의 시작 위치를 반환, 부분 문자열이 기준 문자열 내에 없으면 0을 반환

```sql
SELECT INSTR('MySQL Studies', 'SQL');
```

![Screen_Shot_2022-04-04_at_10 22 09_AM](https://user-images.githubusercontent.com/54128055/161659581-7f222a49-b47e-43c4-905d-01cf74e7e30f.png)
<br/><br/>
- LOCATE(부분 문자열, 기준 문자열)
    - INSTR과 기능 동일, 매개변수 순서만 다름
    - 기준 문자열 내에서 부분 문자열의 시작 위치를 반환, 부분 문자열이 기준 문자열 내에 없으면 0을 반환

```sql
SELECT LOCATE('SQL', 'MySQL Studies');
```

![Screen_Shot_2022-04-04_at_10 22 36_AM](https://user-images.githubusercontent.com/54128055/161659587-4fd4c390-3d0d-42aa-a10a-e3e77c034c1c.png)
<br/><br/><br/>
- ASCII

문자를 ascii 코드로 변환, ascii 코드에 해당되는 문자를 반환

- CHAR(97)의 경우 Workbench 버그로 인해 ‘BLOB’로 나옴

```sql
SELECT ASCII('A')
		 , ASCII('a')
     , CHAR(97)
     , CAST(CHAR(97) as CHAR(1));
```

![Screen_Shot_2022-04-04_at_9 42 09_AM](https://user-images.githubusercontent.com/54128055/161659537-e110fc6e-0d38-47ff-b701-01b752a89d3c.png)
<br/><br/><br/>
- INSERT(문자열1, n1, n2, 문자열2)
    - 문자열1 내에서 n1 번째 문자부터 n2 번째 문자까지 삭제 후 새로운 문자열2 추가

```sql
SELECT INSERT('Oracle query', 1, 6, 'MySQL');
```

![Screen_Shot_2022-04-04_at_11 01 29_AM](https://user-images.githubusercontent.com/54128055/161659594-8bb9d30c-c2b5-4936-b208-a56d38e2d73b.png)
<br/><br/><br/>
- LEFT(문자열, n)
    - 왼쪽을 기준으로 문자열을 n 번째 문자까지만 반환

```sql
SELECT LEFT('MySQL Studies', 5);
```

![Screen_Shot_2022-04-04_at_11 06 57_AM](https://user-images.githubusercontent.com/54128055/161659598-14b79c60-a116-4a11-946f-b98d34274bb8.png)

- RIGHT(문자열, n)
    - 오른쪽을 기준으로 문자열을 n 번째 문자까지만 반환

```sql
SELECT RIGHT('MySQL Studies', 7);
```

![Screen_Shot_2022-04-04_at_11 08 10_AM](https://user-images.githubusercontent.com/54128055/161659605-1cb1c280-4eab-474f-800b-28a35ffd9270.png)
<br/><br/><br/>
- UPPER(문자열), UCASE(문자열)
    - 문자열내에 소문자를 대문자로 반환

```sql
SELECT UCASE('mysql');
```

![Screen_Shot_2022-04-05_at_8 34 59_AM](https://user-images.githubusercontent.com/54128055/161659609-1331eeba-3805-483e-bcfc-aa39aae10dbd.png)

- LOWER(문자열), LCASE(문자열)
    - 문자열내에 대문자를 소문자로 반환

```sql
SELECT LCASE('MYSQL');
```

![Screen_Shot_2022-04-05_at_8 36 23_AM](https://user-images.githubusercontent.com/54128055/161659613-3f512054-2dbf-4c4f-9e89-f9c670103fad.png)
<br/><br/><br/>
- LPAD(문자열1, n, 문자열2)
    - 문자열2를 (n - 문자열1) 만큼 왼쪽에 채워 반환
    - SQL 길이: 3, n: 5, (5-3) 만큼 ‘*’를 왼쪽에 채움

```sql
SELECT LPAD('SQL', 5, '*')
```

![Screen_Shot_2022-04-05_at_8 41 16_AM](https://user-images.githubusercontent.com/54128055/161659620-744c85bf-6570-4f47-ad88-6f567397185a.png)

- RPAD(문자열1, n, 문자열2)
    - 문자열2를 (n - 문자열1) 만큼 오른쪽애 채워 반환

```sql
SELECT RPAD('SQL', 5, '*')
```

![Screen_Shot_2022-04-05_at_8 50 45_AM](https://user-images.githubusercontent.com/54128055/161659624-ed497560-914c-4284-8a25-7c843642ac65.png)
<br/><br/><br/>
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

![Screen_Shot_2022-04-05_at_8 58 24_AM](https://user-images.githubusercontent.com/54128055/161659630-0bee2249-50ab-4489-9b01-efa5de206434.png)

```sql
SELECT TRIM(LEADING FROM '       MySQL       ');
```

![Screen_Shot_2022-04-05_at_9 07 40_AM](https://user-images.githubusercontent.com/54128055/161659636-37d461c0-f758-416b-9c8f-cedfe221878e.png)

```sql
SELECT TRIM(LEADING '*' FROM '*****MySQL*****');
```

![Screen_Shot_2022-04-05_at_9 08 51_AM](https://user-images.githubusercontent.com/54128055/161659641-11d93776-cc79-4fec-9778-40a783806ea2.png)
<br/><br/>
- LTRIM(문자열)
    - 문자열의 왼쪽 공백을 제거하여 반환

```sql
SELECT LTRIM('       MySQL       ');
```

![Screen_Shot_2022-04-05_at_9 10 15_AM](https://user-images.githubusercontent.com/54128055/161659648-2cb9a0df-401e-43f6-9956-2f03ef526e04.png)

- RTRIM(문자열)
    - 문자열의 오른쪽 공백을 제거하여 반환

```sql
SELECT RTRIM('       MySQL       ');
```

![Screen_Shot_2022-04-05_at_9 10 56_AM](https://user-images.githubusercontent.com/54128055/161659654-a1a7f1a0-d2b4-4502-9a5e-456d6403ffb7.png)
<br/><br/><br/>
- REPLACE(문자열, str1, str2)
    - 문자열내에서 str1을 찾아 str2로 대체하여 반환
    - TRIM()으로 할 수 없었던 문자열 내부 공백을 찾아 제거 가능

```sql
SELECT REPLACE('Oracle query', 'Oracle', 'MySQL')
```

![Screen_Shot_2022-04-05_at_9 22 51_AM](https://user-images.githubusercontent.com/54128055/161659660-ad31ba7b-36ee-450f-a3a7-6a84bd0a837e.png)

```sql
SELECT REPLACE('  My S Q L  ', ' ', '');
```

![Screen_Shot_2022-04-05_at_9 25 22_AM](https://user-images.githubusercontent.com/54128055/161659664-0c1ba197-8e50-4fec-af02-a4a881327533.png)
<br/><br/><br/>
- REPEAT(문자열, n)
    - 문자열을 n 번 만큼 반복하여 반환

```sql
SELECT REPEAT('SQL', 5)
```

![Screen_Shot_2022-04-05_at_9 29 50_AM](https://user-images.githubusercontent.com/54128055/161659667-f6c21022-f2fa-406a-a775-9fe3785c9b8e.png)
<br/><br/><br/>
- REVERSE(문자열)
    - 문자열의 순서를 거꾸로 뒤집어 반환

```sql
SELECT REVERSE('MySQL');
```

![Screen_Shot_2022-04-05_at_9 31 21_AM](https://user-images.githubusercontent.com/54128055/161659672-ff088e97-f38f-47d4-a05d-d68355b013a1.png)
<br/><br/><br/>
- SPACE(n)
    - n 길이 만큼의 공백을 반환

```sql
SELECT CONCAT('MySQL', SPACE(10), 'query');
```

![Screen_Shot_2022-04-05_at_9 33 03_AM](https://user-images.githubusercontent.com/54128055/161659677-975b1204-50a9-40b4-8966-a37570fe771e.png)
<br/><br/><br/>
- SUBSTR(문자열, n1, n2), SUBSTRING(문자열, n1, n2), MID(문자열, n1, n2)
    - 문자열의 n1의 위치에서 시작해 n2 길이 만큼 잘라낸 결과를 반환
    - n1을 0으로 명시하면 1이 적용
    - n1이 음수이면 문자열 오른쪽 끝에서부터 거꾸로 세어 가져옴
    - n2를 생략하면 n1부터 문자열 끝까지 반환

```sql
SELECT SUBSTR('ABCDEFG', 3, 2);
```

![Screen_Shot_2022-04-05_at_9 46 19_AM](https://user-images.githubusercontent.com/54128055/161659684-4bffe7a2-49b4-4022-bb5c-691700ea0446.png)
<br/><br/><br/>
- SUBSTRING_INDEX(문자열, str, n)
    - 문자열을 str(구분자) 기준으로 나눈 후 n(구분자 index) 번째 str 부터 등장하는 문자는 제거하고 반환
    - n 이 음수일 경우 문자열의 오른쪽을 시작으로 str의 순서를 매김

```sql
-- 문자열을 ','로 구분
-- 두 번째 ',' 이후의 문자는 제거하고 반환
SELECT SUBSTRING_INDEX('MySQL,ORACLE,MSSQL', ',', 2);
```

![Screen_Shot_2022-04-05_at_10 02 00_AM](https://user-images.githubusercontent.com/54128055/161659688-f793ef66-39f2-4062-b776-258e22e80e79.png)

```sql
SELECT SUBSTRING_INDEX('MySQL,ORACLE,MSSQL', ',', -1);
```

![Screen_Shot_2022-04-05_at_10 07 09_AM](https://user-images.githubusercontent.com/54128055/161659693-a3259d4e-b322-4994-b33d-d12aec784828.png)
<br/><br/><br/>
- REGEXP_REPLACE(문자열, 정규 표현식, str)
    - 정규식을 통해 영문, 한글, 숫자, 특수문자를 제거
    - 문자열 내에서 해당 정규 표현식을 str로 대체하여 반환

```sql
-- 영문 제거
SELECT REGEXP_REPLACE('ab12cd한글(테스트)','[a-z]','');
```

![Screen_Shot_2022-04-05_at_10 15 35_AM](https://user-images.githubusercontent.com/54128055/161659708-0d9ca2c3-0845-4a4e-8767-088806f12ec6.png)

```sql
-- 한글 제거
SELECT REGEXP_REPLACE('ab12cd한글(테스트)','[가-힣]','');
```

![Screen_Shot_2022-04-05_at_10 14 18_AM](https://user-images.githubusercontent.com/54128055/161659698-b0c61413-c906-4092-a0ec-d5e210c89750.png)

```sql
-- 숫자 제거
SELECT REGEXP_REPLACE('ab12cd한글(테스트)','[0-9]','');
```

![Screen_Shot_2022-04-05_at_10 15 23_AM](https://user-images.githubusercontent.com/54128055/161659703-db479a17-500e-4740-91a4-a74fe35a532c.png)

```sql
-- 특수문자 '()' 와 한글 제거
SELECT REGEXP_REPLACE('ab12cd한글(테스트)','[가-힣()]','');
```

![Screen_Shot_2022-04-05_at_10 16 42_AM](https://user-images.githubusercontent.com/54128055/161659713-eb2c1570-4b36-4cbd-9368-4cfb69d02140.png)
