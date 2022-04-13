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

![Screen Shot 2022-04-11 at 9.50.41 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_9.50.41_AM.png)

### 현재 날짜/시간 반환 함수

- SYSDATE() / NOW()
    - 현재 날짜와 시간을 ‘yyyy-mm-dd hh:mm:ss’ 형식으로 반환
    - 반환 값을 문자열 혹은 숫자로 쓰이느냐에 따라 형식을 ‘yyyy-mm-dd hh:mm:ss’, yyyymmddhhmmss 와 같이 지정 가능

```sql
SELECT SYSDATE()
		 , SYSDATE() + 0 ;
```

![Screen Shot 2022-04-11 at 9.57.59 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_9.57.59_AM.png)

- CURDATE() / CURRENT_DATE()
    - 현재 날짜를 ‘yyyy-mm-dd’ 형식으로 반환
    - SYSDATE 와 마찬가지로 반환 값의 형식을 정할 수 있음

```sql
SELECT CURDATE()
		 , CURDATE() + 0;
```

![Screen Shot 2022-04-11 at 9.52.32 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_9.52.32_AM.png)

- CURTIME() / CURRENT_TIME()
    - 현재 시간을 ‘hh:mm:ss’ 형식으로 반환
    - 반환 값을 문자열 혹은 숫자로 변경 가능

```sql
SELECT CURTIME()
	 , CURTIME() + 0;
```

![Screen Shot 2022-04-11 at 9.55.59 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_9.55.59_AM.png)

### 날짜 시간의 특정 부분만 추출하는 함수

- DATE()
    - 연, 월, 일만 반환 (시간 X)

```sql
SELECT DATE('2022-01-01 12:10:23');
```

![Screen Shot 2022-04-11 at 10.05.48 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_10.05.48_AM.png)

- TIME()
    - 시간만 반환

```sql
SELECT TIME('2022-01-01 12:10:23');
```

![Screen Shot 2022-04-11 at 10.06.27 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_10.06.27_AM.png)

- YEAR(*date*)
    - 연도만 반환

```sql
SELECT YEAR('2022-01-01 12:10:23');
```

![Screen Shot 2022-04-11 at 10.08.15 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_10.08.15_AM.png)

- DAYOFYEAR(*date*)
    - 연을 기준으로 몇번째 일인지 반환

```sql
SELECT DAYOFYEAR('2022-12-01 12:10:23');
```

![Screen Shot 2022-04-11 at 10.11.04 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_10.11.04_AM.png)

- WEEKOFYEAR(*date*)
    - 연을 기준으로 몇번째 주인지 반환

```sql
SELECT WEEKOFYEAR('2022-12-01 12:10:23');
```

![Screen Shot 2022-04-11 at 10.12.44 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_10.12.44_AM.png)

- MONTH(*date*)
    - 몇 번째 월인지 반환 (당연히 범위는 1~12)

```sql
SELECT MONTH('2022-01-01 12:10:23');
```

![Screen Shot 2022-04-11 at 10.38.53 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_10.38.53_AM.png)

- MONTHNAME(*date*)
    - 달의 이름을 반환

```sql
SELECT MONTHNAME('2022-01-01 12:10:23');
```

![Screen Shot 2022-04-11 at 10.41.02 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_10.41.02_AM.png)

- WEEK(*date, mode*)
    - 연을 기준으로 몇번째 주인지 반환
    - mode 인자는 한주의 시작을 일요일인지 월요일인지 결정
    - 1월1일이 포함된 주에 새해의 4일 이상 포함되어있으면 1주 차, 그렇지 않으면 전년도의 마지막 주 차

```sql
SELECT WEEK('2022-01-01 12:10:23')
		 , WEEK('2022-12-31 12:10:23');
```

![Screen Shot 2022-04-11 at 10.43.03 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_10.43.03_AM.png)

- DAY(*date*) / DAYOFMONTH(*date*)
    - 해당 달의 일자를 반환
    - 31일이 없는 달의 31을 넣으면 null 반환
    - 31 이 넘는 숫자를 넣으면 null 반환

```sql
SELECT DAY('2022-01-25 12:10:23')
		 , DAYOFMONTH('2022-01-31 12:10:23');
```

![Screen Shot 2022-04-11 at 10.54.29 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_10.54.29_AM.png)

- DAYOFWEEK(*date*)
    - 해당 주의 몇번째 요일인지 반환
    - (1 = 일요일, 2 = 월요일, ... , 7 = 토요일)

```sql
SELECT DAYOFWEEK('2022-01-01 12:10:23');
```

![Screen Shot 2022-04-11 at 11.07.15 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_11.07.15_AM.png)

- WEEKDAY(*date*)
    - 해당 주의 몇번째 요일인지 반환
    - (0 = 월요일, 1 = 화요일, ... , 7 = 일요일)

```sql
SELECT WEEKDAY('2022-01-01 12:10:23');
```

![Screen Shot 2022-04-11 at 11.07.26 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_11.07.26_AM.png)

- DAYNAME(*date*)
    - 해당 날짜의 요일(이름)을 반환

```sql
SELECT DAYNAME('2022-01-01 12:10:23');
```

![Screen Shot 2022-04-11 at 11.08.45 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_11.08.45_AM.png)

- HOUR(*time*)
    - DATETIME 또는 TIME 형식의 인자로부터 시간을 반환하는 함수

```sql
SELECT HOUR('2022-01-01 12:10:23');
```

![Screen Shot 2022-04-11 at 11.13.33 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_11.13.33_AM.png)

- MINUTE(*time*)
    - DATETIME 또는 TIME 형식의 인자로부터 분을 반환하는 함수

```sql
SELECT MINUTE('2022-01-01 12:10:23');
```

![Screen Shot 2022-04-11 at 11.14.16 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_11.14.16_AM.png)

- SECOND(*time*)
    - DATETIME 또는 TIME 형식의 인자로부터 초를 반환하는 함수

```sql
SELECT SECOND('2022-01-01 12:10:23');
```

![Screen Shot 2022-04-11 at 11.14.52 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_11.14.52_AM.png)

- MICROSECOND(*time*)
    - DATETIME 또는 TIME 형식의 인자로부터 마이크로초를 반환하는 함수 (범위 0~999999)

```sql
SELECT MICROSECOND('2022-01-01 12:10:23.0004');
```

![Screen Shot 2022-04-11 at 11.16.09 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_11.16.09_AM.png)

- QUARTER(*time*)
    - 날짜가 몇 분기인지 반환하는 함수

```sql
SELECT QUARTER('2022-01-01 12:10:23')
		 , QUARTER('2022-04-01 12:10:23')
		 , QUARTER('2022-07-01 12:10:23')
     , QUARTER('2022-10-01 12:10:23');
```

![Screen Shot 2022-04-11 at 11.19.34 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_11.19.34_AM.png)

### 날짜 / 시간 계산 함수

- ADDTIME(*expr, expr2*)
    - TIME 혹은 DATETIME 형식의 expr 에 TIME 형식의 expr2 를 더하여 반환

```sql
SELECT ADDTIME('2022-01-01 12:00:00', '3:00:00');
```

![Screen Shot 2022-04-12 at 10.19.47 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-12_at_10.19.47_AM.png)

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

![Screen Shot 2022-04-12 at 11.50.10 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-12_at_11.50.10_AM.png)

- ADDDATE(*date, expr*), ADDDATE(*date, INTERVAL, expr*)
    - expr 인자를 INTERVAL 과 사용시, DATE_ADD의 별칭
    - date 에서 expr 값을 더하여 반환하는 함수

```sql
SELECT ADDDATE('2022-01-01 12:00:00', INTERVAL 1 DAY)
		 , ADDDATE('2022-01-01 12:00:00', 3)
     , ADDDATE('2022-01-01 12:00:00', -3);
```

![Screen Shot 2022-04-13 at 9.06.41 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-13_at_9.06.41_AM.png)

- DATE_SUB(*date, INTERVAL expr*)
    - DATE_ADD() 와는 반대로 date 에서 expr 값을 빼는 함수
    - expr 인자에 ‘-’ 부여시 두 인자의 합을 반환

```sql
SELECT DATE_SUB('2022-01-01 12:00:00', INTERVAL 1 DAY)
		 , DATE_SUB('2022-01-01 12:00:00', INTERVAL -1 DAY);
```

![Screen Shot 2022-04-13 at 9.34.44 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-13_at_9.34.44_AM.png)

- SUBDATE(*date, expr*), SUBDATE(*date, INTERVAL expr*)
    - expr 인자를 INTERVAL 과 사용시, DATE_SUB 의 별칭
    - date 에서 expr 값을 빼서 반환하는 함수

```sql
SELECT SUBDATE('2022-01-01 12:00:00', INTERVAL 1 DAY)
		 , SUBDATE('2022-01-01 12:00:00', 3)
     , SUBDATE('2022-01-01 12:00:00', -3);
```

![Screen Shot 2022-04-13 at 9.41.45 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-13_at_9.41.45_AM.png)

- DATEDIFF(*date1, date2*)
    - 시작 날짜 date1 과 마지막 날짜 date2 사이의 일수를 반환
    - 두 인자는 DATE 혹은 DATETIME의 형식, 반환값은 DATE

```sql
SELECT DATEDIFF('2022-01-01 12:10:23', '2022-03-27')
		 , DATEDIFF('2022-03-27', '2022-01-01');
```

![Screen Shot 2022-04-13 at 10.19.04 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-13_at_10.19.04_AM.png)

- TIMESTAMPDIFF(*interval, date1, date2*)
    - DATE 혹은 DATETIME 형식의 date1 인자와 date2 인자간의 차이를 정수값으로 반환
    - 반환값의 단위는 interval 인자에 따라 달라짐
    - interval: (YEAR, QUARTER, MONTH, WEEK, DAY, HOUR, MINUTE, SECOND, FRAC_SECOND)

```sql
SELECT TIMESTAMPDIFF(DAY, '2022-01-01 12:10:23', '2022-03-27 12:00:00' )
		 , TIMESTAMPDIFF(MONTH, '2022-01-01 12:10:23', '2022-03-27 12:00:00' );
```

![Screen Shot 2022-04-13 at 10.48.42 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-13_at_10.48.42_AM.png)

- PERIOD_ADD(*period, n*)
    - period 인자에 n 월을 더하여 반환하는 함수
    - period 인자는 YYMM, YYYYMM 형식의 문자열, 반환값은 YYYYMM의 형식
    - n 은 정수

```sql
SELECT PERIOD_ADD('202201', 12);
```

![Screen Shot 2022-04-13 at 10.49.13 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-13_at_10.49.13_AM.png)

- PERIOD_DIFF(*period1, period2*)
    - period1 과 period2 사이의 개월수를 반환하는 함수
    - 두 인자 모두 YYMM 혹은 YYYYMM 형식의 문자열

```sql
SELECT PERIOD_DIFF('202212', '202202');
```

![Screen Shot 2022-04-13 at 10.49.23 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-13_at_10.49.23_AM.png)

- TO_DAYS(*date*)
    - 0001년 01월 01일로 부터 인자 date 까지의 일수를 반환

```sql
SELECT TO_DAYS('2022-01-01 12:10:23');
```

![Screen Shot 2022-04-13 at 10.59.10 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-13_at_10.59.10_AM.png)

- FROM_DAYS(*n*)
    - 0001년 01월 01일로 부터 일수 n 만큼이 지난 날짜를 반환

```sql
SELECT FROM_DAYS(738521);
```

![Screen Shot 2022-04-13 at 11.01.59 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-13_at_11.01.59_AM.png)

- LAST_DAY(*date*)
    - date 값의 당월의 마지막 날을 반환하는 함수
    - date 인자는 DATETIME 혹은 DATE 형식
    - date 인자가 유효하지 않은 값이면 NULL 반환

```sql
SELECT LAST_DAY('2022-01-01 12:10:23')
		 , LAST_DAY('2022-01-32 12:10:23');
```

![Screen Shot 2022-04-13 at 11.08.29 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-13_at_11.08.29_AM.png)

- MAKEDATE(*year, dayofyear*)
    - year 인자와 dayofyear 인자가 주어지면 날짜를 반환하는 함수
    - dayofyear 인자가 1 보다 작을시 NULL 반환

```sql
SELECT LAST_DAY('2022-01-01 12:10:23')
		 , LAST_DAY('2022-01-32 12:10:23');
```

![Screen Shot 2022-04-13 at 11.11.40 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-13_at_11.11.40_AM.png)

- MAKETIME(*hour, minute, second*)
    - hour, minute, second 인자가 주어지면 시간을 반환한다

```sql
SELECT MAKETIME(22, 38, 12);
```

![Screen Shot 2022-04-13 at 11.13.21 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-13_at_11.13.21_AM.png)