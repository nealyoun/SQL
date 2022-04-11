# Date_Functions

### 날짜 형식 설정 함수

- DATE_FORMAT(date, format)

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
    - 연도와 날짜만 반환

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

- YEAR()
    - 연도만 반환

```sql
SELECT YEAR('2022-01-01 12:10:23');
```

![Screen Shot 2022-04-11 at 10.08.15 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_10.08.15_AM.png)

- DAYOFYEAR()
    - 연을 기준으로 몇번째 일인지 반환

```sql
SELECT DAYOFYEAR('2022-12-01 12:10:23');
```

![Screen Shot 2022-04-11 at 10.11.04 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_10.11.04_AM.png)

- WEEKOFYEAR()
    - 연을 기준으로 몇번째 주인지 반환

```sql
SELECT WEEKOFYEAR('2022-12-01 12:10:23');
```

![Screen Shot 2022-04-11 at 10.12.44 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_10.12.44_AM.png)

- MONTH()
    - 몇 번째 월인지 반환 (당연히 범위는 1~12)

```sql
SELECT MONTH('2022-01-01 12:10:23');
```

![Screen Shot 2022-04-11 at 10.38.53 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_10.38.53_AM.png)

- MONTHNAME()
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

- DAY() / DAYOFMONTH()
    - 해당 달의 일자를 반환
    - 31일이 없는 달의 31을 넣으면 null 반환
    - 31 이 넘는 숫자를 넣으면 null 반환

```sql
SELECT DAY('2022-01-25 12:10:23')
		 , DAYOFMONTH('2022-01-31 12:10:23');
```

![Screen Shot 2022-04-11 at 10.54.29 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_10.54.29_AM.png)

- DAYOFWEEK()
    - 해당 주의 몇번째 요일인지 반환
    - (1 = 일요일, 2 = 월요일, ... , 7 = 토요일)

```sql
SELECT DAYOFWEEK('2022-01-01 12:10:23');
```

![Screen Shot 2022-04-11 at 11.07.15 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_11.07.15_AM.png)

- WEEKDAY()
    - 해당 주의 몇번째 요일인지 반환
    - (0 = 월요일, 1 = 화요일, ... , 7 = 일요일)

```sql
SELECT WEEKDAY('2022-01-01 12:10:23');
```

![Screen Shot 2022-04-11 at 11.07.26 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_11.07.26_AM.png)

- DAYNAME()
    - 해당 날짜의 요일(이름)을 반환

```sql
SELECT DAYNAME('2022-01-01 12:10:23');
```

![Screen Shot 2022-04-11 at 11.08.45 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_11.08.45_AM.png)

- HOUR()
    - DATETIME 또는 TIME 형식의 인자로부터 시간을 반환하는 함수

```sql
SELECT HOUR('2022-01-01 12:10:23');
```

![Screen Shot 2022-04-11 at 11.13.33 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_11.13.33_AM.png)

- MINUTE()
    - DATETIME 또는 TIME 형식의 인자로부터 분을 반환하는 함수

```sql
SELECT MINUTE('2022-01-01 12:10:23');
```

![Screen Shot 2022-04-11 at 11.14.16 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_11.14.16_AM.png)

- SECOND()
    - DATETIME 또는 TIME 형식의 인자로부터 초를 반환하는 함수

```sql
SELECT SECOND('2022-01-01 12:10:23');
```

![Screen Shot 2022-04-11 at 11.14.52 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_11.14.52_AM.png)

- MICROSECOND()
    - DATETIME 또는 TIME 형식의 인자로부터 마이크로초를 반환하는 함수 (범위 0~999999)

```sql
SELECT MICROSECOND('2022-01-01 12:10:23.0004');
```

![Screen Shot 2022-04-11 at 11.16.09 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_11.16.09_AM.png)

- QUARTER()
    - 날짜가 몇 분기인지 반환하는 함수

```sql
SELECT QUARTER('2022-01-01 12:10:23')
		 , QUARTER('2022-04-01 12:10:23')
		 , QUARTER('2022-07-01 12:10:23')
     , QUARTER('2022-10-01 12:10:23');
```

![Screen Shot 2022-04-11 at 11.19.34 AM.png](Date_Funct%2077c58/Screen_Shot_2022-04-11_at_11.19.34_AM.png)

### 날짜 / 시간 계산 함수