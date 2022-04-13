# Date_Functions

### DATE, DATETIME, TIME, TIMESTAMP

- DATE
    - DATE 타입/형식은 날짜는 포함되지만 시간이 포함되지 않는 형식
    - EX) YYYY-MM-DD
- DATETIME
    - DATETIME 타입은 날짜와 시간을 모두 포함한 형식
    - EX) YYYY-MM-DD HH:MM:SS
- TIME
    - TIME 타입은 시간에 대한 정보만을 가지고 있는 형식
    - EX) HH:MM:SS
- TIMESTAMP
    - TIMESTAMP 는 DATETIME 과 마찬가지로 날짜와 시간을 모두 담고 있는 형식

- DATETIME VS. TIMESTAMP
    1. Type
        - DATETIME: 문자형
        - TIMESTAMP: 숫자형
    2. 용량 단위
        - DATETIME: 8 byte
        - TIMESTAMP: 4 byte
    3. 데이터 입력
        - DATETIME 은 데이터를 입력 해주어야 날짜가 입력됨
        - TIMESTAMP 는 데이터를 입력해 주지 않고 저장해도 자동으로 현재 날짜가 입력됨
<br/><br/><br/>
---
<br/>

### 날짜 형식 설정 함수

- DATE_FORMAT(date, format)
    - 반환되는 날짜 표현을 설정하는 함수
    - date 는 DATETIME 혹은 DATE 형식의 인자

```sql
SELECT DATE_FORMAT('2022-01-01 12:00:00', '%y-%m-%d');
```

```
`%W': Weekday name (`Sunday'..`Saturday')
`%D': Day of the month with english suffix (`1st', `2nd', `3rd', etc.)
`%Y': Year, numeric, 4 digits
`%y': Year, numeric, 2 digits
`%a': Abbreviated weekday name (`Sun'..`Sat')
`%d': Day of the month, numeric (`00'..`31')
`%e': Day of the month, numeric (`0'..`31')
`%m': Month, numeric (`01'..`12')
`%c': Month, numeric (`1'..`12')
`%b': Abbreviated month name (`Jan'..`Dec')
`%j': Day of year (`001'..`366')
`%H': Hour (`00'..`23')
`%k': Hour (`0'..`23')
`%h': Hour (`01'..`12')
`%I': Hour (`01'..`12')
`%l': Hour (`1'..`12')
`%i': Minutes, numeric (`00'..`59')
`%r': Time, 12-hour (`hh:mm:ss [AP]M')
`%T': Time, 24-hour (`hh:mm:ss')
`%S': Seconds (`00'..`59')
`%s': Seconds (`00'..`59')
`%p': `AM' or `PM'
`%w': Day of the week (`0'=Sunday..`6'=Saturday)
`%U': Week (`0'..`52'), Sunday is the first day of the week.
`%u': Week (`0'..`52'), Monday is the first day of the week.
```

![Screen_Shot_2022-04-11_at_9 50 41_AM](https://user-images.githubusercontent.com/54128055/163126700-6b80b964-2cac-4fe7-a649-4c2566dc77b1.png)
<br/><br/><br/>
---
<br/>

### 현재 날짜/시간 반환 함수

- SYSDATE() / NOW()
    - 현재 날짜와 시간을 ‘yyyy-mm-dd hh:mm:ss’ 형식으로 반환
    - 반환 값을 문자열 혹은 숫자로 쓰이느냐에 따라 형식을 ‘yyyy-mm-dd hh:mm:ss’, yyyymmddhhmmss 와 같이 지정 가능

```sql
SELECT SYSDATE()
		 , SYSDATE() + 0 ;
```

![Screen_Shot_2022-04-11_at_9 57 59_AM](https://user-images.githubusercontent.com/54128055/163126712-3ccc4a73-bc7d-4086-81ec-3698ce7ca111.png)
<br/><br/>
- CURDATE() / CURRENT_DATE()
    - 현재 날짜를 ‘yyyy-mm-dd’ 형식으로 반환
    - SYSDATE 와 마찬가지로 반환 값의 형식을 정할 수 있음

```sql
SELECT CURDATE()
		 , CURDATE() + 0;
```

![Screen_Shot_2022-04-11_at_9 52 32_AM](https://user-images.githubusercontent.com/54128055/163126706-db4e4909-a29d-4232-81d5-215b23302418.png)
<br/><br/>
- CURTIME() / CURRENT_TIME()
    - 현재 시간을 ‘hh:mm:ss’ 형식으로 반환
    - 반환 값을 문자열 혹은 숫자로 변경 가능

```sql
SELECT CURTIME()
	 , CURTIME() + 0;
```

![Screen_Shot_2022-04-11_at_9 55 59_AM](https://user-images.githubusercontent.com/54128055/163126711-88b53be1-8ffc-4417-9c49-2788c27c71e2.png)
<br/><br/><br/>
---
<br/>

### 날짜 시간의 특정 부분만 추출하는 함수

- DATE()
    - 연, 월, 일만 반환 (시간 X)

```sql
SELECT DATE('2022-01-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_10 05 48_AM](https://user-images.githubusercontent.com/54128055/163126718-f14185fd-2291-4d4f-8c66-980b308bcaf0.png)
<br/><br/>
- TIME()
    - 시간만 반환

```sql
SELECT TIME('2022-01-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_10 06 27_AM](https://user-images.githubusercontent.com/54128055/163126722-a138c3b3-71d5-4912-949d-64d59b01dfc4.png)
<br/><br/>
- YEAR(*date*)
    - 연도만 반환

```sql
SELECT YEAR('2022-01-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_10 08 15_AM](https://user-images.githubusercontent.com/54128055/163126726-04c036d9-574c-47ca-be24-ad86fd28cf73.png)
<br/><br/>
- DAYOFYEAR(*date*)
    - 연을 기준으로 몇번째 일인지 반환

```sql
SELECT DAYOFYEAR('2022-12-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_10 11 04_AM](https://user-images.githubusercontent.com/54128055/163126727-f5ba4c73-84e9-4376-9693-a39e606a6599.png)
<br/><br/>
- WEEKOFYEAR(*date*)
    - 연을 기준으로 몇번째 주인지 반환

```sql
SELECT WEEKOFYEAR('2022-12-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_10 12 44_AM](https://user-images.githubusercontent.com/54128055/163126728-d575fd7a-59c4-40f9-98be-3a180a18f98a.png)
<br/><br/>
- MONTH(*date*)
    - 몇 번째 월인지 반환 (당연히 범위는 1~12)

```sql
SELECT MONTH('2022-01-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_10 38 53_AM](https://user-images.githubusercontent.com/54128055/163126729-ca049d66-a2a3-4157-8cdf-9a4f97aeedad.png)
<br/><br/>
- MONTHNAME(*date*)
    - 달의 이름을 반환

```sql
SELECT MONTHNAME('2022-01-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_10 41 02_AM](https://user-images.githubusercontent.com/54128055/163126731-35fbe61c-e607-4dda-85a2-a27179fe9144.png)
<br/><br/>
- WEEK(*date, mode*)
    - 연을 기준으로 몇번째 주인지 반환
    - mode 인자는 한주의 시작을 일요일인지 월요일인지 결정
    - 1월1일이 포함된 주에 새해의 4일 이상 포함되어있으면 1주 차, 그렇지 않으면 전년도의 마지막 주 차

```sql
SELECT WEEK('2022-01-01 12:10:23')
		 , WEEK('2022-12-31 12:10:23');
```

![Screen_Shot_2022-04-11_at_10 43 03_AM](https://user-images.githubusercontent.com/54128055/163126733-ab695865-0c80-4115-bc99-96dc87e9f429.png)
<br/><br/>
- DAY(*date*) / DAYOFMONTH(*date*)
    - 해당 달의 일자를 반환
    - 31일이 없는 달의 31을 넣으면 null 반환
    - 31 이 넘는 숫자를 넣으면 null 반환

```sql
SELECT DAY('2022-01-25 12:10:23')
		 , DAYOFMONTH('2022-01-31 12:10:23');
```

![Screen_Shot_2022-04-11_at_10 54 29_AM](https://user-images.githubusercontent.com/54128055/163126735-d160feab-719d-4267-b0c1-3df1a6d82f9e.png)
<br/><br/>
- DAYOFWEEK(*date*)
    - 해당 주의 몇번째 요일인지 반환
    - (1 = 일요일, 2 = 월요일, ... , 7 = 토요일)

```sql
SELECT DAYOFWEEK('2022-01-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_11 07 15_AM](https://user-images.githubusercontent.com/54128055/163126737-b6fab44c-548a-46f7-aafe-501de0cb8b76.png)
<br/><br/>
- WEEKDAY(*date*)
    - 해당 주의 몇번째 요일인지 반환
    - (0 = 월요일, 1 = 화요일, ... , 7 = 일요일)

```sql
SELECT WEEKDAY('2022-01-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_11 07 26_AM](https://user-images.githubusercontent.com/54128055/163126741-d40cc0ad-d61e-4be8-962d-aad0f807044c.png)
<br/><br/>
- DAYNAME(*date*)
    - 해당 날짜의 요일(이름)을 반환

```sql
SELECT DAYNAME('2022-01-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_11 08 45_AM](https://user-images.githubusercontent.com/54128055/163126743-20429bc9-cb37-405c-a7c8-e8269af11726.png)
<br/><br/>
- HOUR(*time*)
    - DATETIME 또는 TIME 형식의 인자로부터 시간을 반환하는 함수

```sql
SELECT HOUR('2022-01-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_11 13 33_AM](https://user-images.githubusercontent.com/54128055/163126747-7fd6a718-9085-48a4-a1ad-38786dc798db.png)
<br/><br/>
- MINUTE(*time*)
    - DATETIME 또는 TIME 형식의 인자로부터 분을 반환하는 함수

```sql
SELECT MINUTE('2022-01-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_11 14 16_AM](https://user-images.githubusercontent.com/54128055/163126750-2598546a-f491-42c9-b2b2-f2d57d948d70.png)
<br/><br/>
- SECOND(*time*)
    - DATETIME 또는 TIME 형식의 인자로부터 초를 반환하는 함수

```sql
SELECT SECOND('2022-01-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_11 14 52_AM](https://user-images.githubusercontent.com/54128055/163126754-99b4a889-dc2e-4a6d-bca0-d0c84c168e79.png)
<br/><br/>
- MICROSECOND(*time*)
    - DATETIME 또는 TIME 형식의 인자로부터 마이크로초를 반환하는 함수 (범위 0~999999)

```sql
SELECT MICROSECOND('2022-01-01 12:10:23.0004');
```

![Screen_Shot_2022-04-11_at_11 16 09_AM](https://user-images.githubusercontent.com/54128055/163126756-98c1ce27-4aa4-4d24-a410-3952742f98da.png)
<br/><br/>
- QUARTER(*time*)
    - 날짜가 몇 분기인지 반환하는 함수

```sql
SELECT QUARTER('2022-01-01 12:10:23')
		 , QUARTER('2022-04-01 12:10:23')
		 , QUARTER('2022-07-01 12:10:23')
     , QUARTER('2022-10-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_11 19 34_AM](https://user-images.githubusercontent.com/54128055/163126759-67202c59-435e-4817-b0ff-4fa2bea78b1b.png)
<br/><br/><br/>
---
<br/>

### 날짜 / 시간 계산 함수

- ADDTIME(*expr, expr2*)
    - TIME 혹은 DATETIME 형식의 expr 에 TIME 형식의 expr2 를 더하여 반환

```sql
SELECT ADDTIME('2022-01-01 12:00:00', '3:00:00');
```

![Screen_Shot_2022-04-12_at_10 19 47_AM](https://user-images.githubusercontent.com/54128055/163126763-9c0ff367-617c-4b6e-9690-6198c3a4e43d.png)
<br/><br/>
- SUBTIME(*expr, expr2*)
    - TIME 혹은 DATETIME 형식의 expr 에 TIME 형식의 expr2 를 빼고 반환

```sql
SELECT SUBTIME('2022-01-01 12:00:00', '3:00:00');
```

- DATE_ADD(*date, INTERVAL expr*)
    - date 에 expr 값을 더하여 반환하는 함수
    - date 는 DATETIME 혹은 DATE 의 형식
    - expr 은 (YEAR, MONTH, DAY, HOUR, MINUTE, SECOND) 등 계산될 단위 명시
    - expr 인자에 ‘-’ 부여시 뺄셈도 가능

```sql
SELECT DATE_ADD('2022-01-01 12:00:00', INTERVAL 1 DAY)
		 , DATE_ADD('2022-01-01 12:00:00', INTERVAL -1 DAY);
```

![Screen_Shot_2022-04-12_at_11 50 10_AM](https://user-images.githubusercontent.com/54128055/163126768-715f0d64-7529-4053-9db2-6b901269c89f.png)
<br/><br/>
- ADDDATE(*date, expr*), ADDDATE(*date, INTERVAL, expr*)
    - expr 인자를 INTERVAL 과 사용시, DATE_ADD의 별칭
    - date 에서 expr 값을 더하여 반환하는 함수

```sql
SELECT ADDDATE('2022-01-01 12:00:00', INTERVAL 1 DAY)
		 , ADDDATE('2022-01-01 12:00:00', 3)
     , ADDDATE('2022-01-01 12:00:00', -3);
```

![Screen_Shot_2022-04-13_at_9 06 41_AM](https://user-images.githubusercontent.com/54128055/163126769-2e414c36-2e30-4239-ab3a-142488e95748.png)
<br/><br/>
- DATE_SUB(*date, INTERVAL expr*)
    - DATE_ADD() 와는 반대로 date 에서 expr 값을 빼는 함수
    - expr 인자에 ‘-’ 부여시 두 인자의 합을 반환

```sql
SELECT DATE_SUB('2022-01-01 12:00:00', INTERVAL 1 DAY)
		 , DATE_SUB('2022-01-01 12:00:00', INTERVAL -1 DAY);
```

![Screen_Shot_2022-04-13_at_9 34 44_AM](https://user-images.githubusercontent.com/54128055/163126772-be137094-8f91-4540-a987-c5700b270746.png)
<br/><br/>
- SUBDATE(*date, expr*), SUBDATE(*date, INTERVAL expr*)
    - expr 인자를 INTERVAL 과 사용시, DATE_SUB 의 별칭
    - date 에서 expr 값을 빼서 반환하는 함수

```sql
SELECT SUBDATE('2022-01-01 12:00:00', INTERVAL 1 DAY)
		 , SUBDATE('2022-01-01 12:00:00', 3)
     , SUBDATE('2022-01-01 12:00:00', -3);
```

![Screen_Shot_2022-04-13_at_9 41 45_AM](https://user-images.githubusercontent.com/54128055/163126774-eb4c0bc9-97ad-47b5-89f6-aae70b0007da.png)
<br/><br/>
- DATEDIFF(*date1, date2*)
    - 시작 날짜 date1 과 마지막 날짜 date2 사이의 일수를 반환
    - 두 인자는 DATE 혹은 DATETIME의 형식, 반환값은 DATE

```sql
SELECT DATEDIFF('2022-01-01 12:10:23', '2022-03-27')
		 , DATEDIFF('2022-03-27', '2022-01-01');
```

![Screen_Shot_2022-04-13_at_10 19 04_AM](https://user-images.githubusercontent.com/54128055/163126775-a3954bb1-7156-4657-a27c-695255042e9d.png)
<br/><br/>
- TIMESTAMPDIFF(*interval, date1, date2*)
    - DATE 혹은 DATETIME 형식의 date1 인자와 date2 인자간의 차이를 정수값으로 반환
    - 반환값의 단위는 interval 인자에 따라 달라짐
    - interval: (YEAR, QUARTER, MONTH, WEEK, DAY, HOUR, MINUTE, SECOND, FRAC_SECOND)

```sql
SELECT TIMESTAMPDIFF(DAY, '2022-01-01 12:10:23', '2022-03-27 12:00:00' )
		 , TIMESTAMPDIFF(MONTH, '2022-01-01 12:10:23', '2022-03-27 12:00:00' );
```

![Screen_Shot_2022-04-13_at_10 48 42_AM](https://user-images.githubusercontent.com/54128055/163126781-c907de48-564a-4c5e-a7cb-7ebe96623570.png)
<br/><br/>
- PERIOD_ADD(*period, n*)
    - period 인자에 n 월을 더하여 반환하는 함수
    - period 인자는 YYMM, YYYYMM 형식의 문자열, 반환값은 YYYYMM의 형식
    - n 은 정수

```sql
SELECT PERIOD_ADD('202201', 12);
```

![Screen_Shot_2022-04-13_at_10 49 13_AM](https://user-images.githubusercontent.com/54128055/163126784-6f7cc7a1-8777-4646-aa7e-4151d58329c2.png)
<br/><br/>
- PERIOD_DIFF(*period1, period2*)
    - period1 과 period2 사이의 개월수를 반환하는 함수
    - 두 인자 모두 YYMM 혹은 YYYYMM 형식의 문자열

```sql
SELECT PERIOD_DIFF('202212', '202202');
```

![Screen_Shot_2022-04-13_at_10 49 23_AM](https://user-images.githubusercontent.com/54128055/163126787-a03803d5-8cc1-470f-b24d-160a0c2bbc26.png)
<br/><br/>
---

- TO_DAYS(*date*)
    - 0001년 01월 01일로 부터 인자 date 까지의 일수를 반환

```sql
SELECT TO_DAYS('2022-01-01 12:10:23');
```

![Screen_Shot_2022-04-13_at_10 59 10_AM](https://user-images.githubusercontent.com/54128055/163126788-ee3a5149-c631-4a4a-9f86-cd890dd7b034.png)
<br/><br/>
- FROM_DAYS(*n*)
    - 0001년 01월 01일로 부터 일수 n 만큼이 지난 날짜를 반환

```sql
SELECT FROM_DAYS(738521);
```

![Screen_Shot_2022-04-13_at_11 01 59_AM](https://user-images.githubusercontent.com/54128055/163126790-5ffd2225-c23e-4ae2-a212-395cae54c7b2.png)
<br/><br/>
- LAST_DAY(*date*)
    - date 값의 당월의 마지막 날을 반환하는 함수
    - date 인자는 DATETIME 혹은 DATE 형식
    - date 인자가 유효하지 않은 값이면 NULL 반환

```sql
SELECT LAST_DAY('2022-01-01 12:10:23')
		 , LAST_DAY('2022-01-32 12:10:23');
```

![Screen_Shot_2022-04-13_at_11 08 29_AM](https://user-images.githubusercontent.com/54128055/163126793-18ebcbea-a023-4681-b8f0-a6a14fd4a165.png)
<br/><br/>
- MAKEDATE(*year, dayofyear*)
    - year 인자와 dayofyear 인자가 주어지면 날짜를 반환하는 함수
    - dayofyear 인자가 1 보다 작을시 NULL 반환

```sql
SELECT LAST_DAY('2022-01-01 12:10:23')
		 , LAST_DAY('2022-01-32 12:10:23');
```

![Screen_Shot_2022-04-13_at_11 11 40_AM](https://user-images.githubusercontent.com/54128055/163126795-e755c545-f909-4f19-9252-b4761efcf0bf.png)
<br/><br/>
- MAKETIME(*hour, minute, second*)
    - hour, minute, second 인자가 주어지면 시간을 반환한다

```sql
SELECT MAKETIME(22, 38, 12);
```

![Screen_Shot_2022-04-13_at_11 13 21_AM](https://user-images.githubusercontent.com/54128055/163126799-e6f9ef7a-de13-46cf-b51f-badd82926e77.png)
