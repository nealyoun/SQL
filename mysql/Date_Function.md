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

![Screen_Shot_2022-04-11_at_9 50 41_AM](https://user-images.githubusercontent.com/54128055/162738881-6831d566-89b3-4f0b-b064-99d6193d935e.png)

### 현재 날짜/시간 반환 함수

- SYSDATE() / NOW()
    - 현재 날짜와 시간을 ‘yyyy-mm-dd hh:mm:ss’ 형식으로 반환
    - 반환 값을 문자열 혹은 숫자로 쓰이느냐에 따라 형식을 ‘yyyy-mm-dd hh:mm:ss’, yyyymmddhhmmss 와 같이 지정 가능

```sql
SELECT SYSDATE()
		 , SYSDATE() + 0 ;
```

![Screen_Shot_2022-04-11_at_9 57 59_AM](https://user-images.githubusercontent.com/54128055/162738891-848795c2-cccd-460e-a8c6-ae83cb5a2001.png)

- CURDATE() / CURRENT_DATE()
    - 현재 날짜를 ‘yyyy-mm-dd’ 형식으로 반환
    - SYSDATE 와 마찬가지로 반환 값의 형식을 정할 수 있음

```sql
SELECT CURDATE()
		 , CURDATE() + 0;
```

![Screen_Shot_2022-04-11_at_9 52 32_AM](https://user-images.githubusercontent.com/54128055/162738885-e1384630-446c-4ecb-8d2d-eafdb1d75548.png)

- CURTIME() / CURRENT_TIME()
    - 현재 시간을 ‘hh:mm:ss’ 형식으로 반환
    - 반환 값을 문자열 혹은 숫자로 변경 가능

```sql
SELECT CURTIME()
	 , CURTIME() + 0;
```

![Screen_Shot_2022-04-11_at_9 55 59_AM](https://user-images.githubusercontent.com/54128055/162738890-065df9ad-9de7-4499-8590-a0426487d31a.png)

### 날짜 시간의 특정 부분만 추출하는 함수

- DATE()
    - 연도와 날짜만 반환

```sql
SELECT DATE('2022-01-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_10 05 48_AM](https://user-images.githubusercontent.com/54128055/162738893-870ec015-ba07-4c67-a9f2-1b9bed9e25be.png)

- TIME()
    - 시간만 반환

```sql
SELECT TIME('2022-01-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_10 06 27_AM](https://user-images.githubusercontent.com/54128055/162738895-900deb5c-94d6-4c2c-8410-859bfa6aa9e3.png)

- YEAR()
    - 연도만 반환

```sql
SELECT YEAR('2022-01-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_10 08 15_AM](https://user-images.githubusercontent.com/54128055/162738896-c75ddc1f-3e58-4bf7-8cae-d167e042cc36.png)

- DAYOFYEAR()
    - 연을 기준으로 몇번째 일인지 반환

```sql
SELECT DAYOFYEAR('2022-12-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_10 11 04_AM](https://user-images.githubusercontent.com/54128055/162738899-2c19e3e8-ff2d-4c4c-9f54-4c828db62d56.png)

- WEEKOFYEAR()
    - 연을 기준으로 몇번째 주인지 반환

```sql
SELECT WEEKOFYEAR('2022-12-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_10 12 44_AM](https://user-images.githubusercontent.com/54128055/162738900-8058ac7e-ebea-4ed7-888c-f936ca2eb576.png))

- MONTH()
    - 몇 번째 월인지 반환 (당연히 범위는 1~12)

```sql
SELECT MONTH('2022-01-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_10 38 53_AM](https://user-images.githubusercontent.com/54128055/162738902-8d2833e1-c0c1-434c-8ca7-11842e38526f.png)

- MONTHNAME()
    - 달의 이름을 반환

```sql
SELECT MONTHNAME('2022-01-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_10 41 02_AM](https://user-images.githubusercontent.com/54128055/162738904-58300ace-3957-43df-8f49-7c21af12921c.png)

- WEEK(*date, mode*)
    - 연을 기준으로 몇번째 주인지 반환
    - mode 인자는 한주의 시작을 일요일인지 월요일인지 결정
    - 1월1일이 포함된 주에 새해의 4일 이상 포함되어있으면 1주 차, 그렇지 않으면 전년도의 마지막 주 차

```sql
SELECT WEEK('2022-01-01 12:10:23')
		 , WEEK('2022-12-31 12:10:23');
```

![Screen_Shot_2022-04-11_at_10 43 03_AM](https://user-images.githubusercontent.com/54128055/162738907-6af610ef-aaa7-49b4-800a-b1e90b76565d.png)

- DAY() / DAYOFMONTH()
    - 해당 달의 일자를 반환
    - 31일이 없는 달의 31을 넣으면 null 반환
    - 31 이 넘는 숫자를 넣으면 null 반환

```sql
SELECT DAY('2022-01-25 12:10:23')
		 , DAYOFMONTH('2022-01-31 12:10:23');
```

![Screen_Shot_2022-04-11_at_10 54 29_AM](https://user-images.githubusercontent.com/54128055/162738909-3a093324-e253-4568-977d-52cf9822dc1c.png)

- DAYOFWEEK()
    - 해당 주의 몇번째 요일인지 반환
    - (1 = 일요일, 2 = 월요일, ... , 7 = 토요일)

```sql
SELECT DAYOFWEEK('2022-01-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_11 07 15_AM](https://user-images.githubusercontent.com/54128055/162738910-38517eaf-d7fe-42d9-a219-44dd6c1fe24a.png)

- WEEKDAY()
    - 해당 주의 몇번째 요일인지 반환
    - (0 = 월요일, 1 = 화요일, ... , 7 = 일요일)

```sql
SELECT WEEKDAY('2022-01-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_11 07 26_AM](https://user-images.githubusercontent.com/54128055/162738911-57a67f9b-57e7-4f9b-a861-2eb02dc16736.png)

- DAYNAME()
    - 해당 날짜의 요일(이름)을 반환

```sql
SELECT DAYNAME('2022-01-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_11 08 45_AM](https://user-images.githubusercontent.com/54128055/162738912-be6a4975-da86-4fae-97cf-6f4b446c3907.png)

- HOUR()
    - DATETIME 또는 TIME 형식의 인자로부터 시간을 반환하는 함수

```sql
SELECT HOUR('2022-01-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_11 13 33_AM](https://user-images.githubusercontent.com/54128055/162738914-842b4b29-8996-4ab7-8ccd-b260b3f8f169.png)

- MINUTE()
    - DATETIME 또는 TIME 형식의 인자로부터 분을 반환하는 함수

```sql
SELECT MINUTE('2022-01-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_11 14 16_AM](https://user-images.githubusercontent.com/54128055/162738915-2b0e8c05-aec2-4cfc-a022-8d15fa713d73.png)

- SECOND()
    - DATETIME 또는 TIME 형식의 인자로부터 초를 반환하는 함수

```sql
SELECT SECOND('2022-01-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_11 14 52_AM](https://user-images.githubusercontent.com/54128055/162738917-f4579e39-8043-4e49-b87f-5269f3ad2745.png)

- MICROSECOND()
    - DATETIME 또는 TIME 형식의 인자로부터 마이크로초를 반환하는 함수 (범위 0~999999)

```sql
SELECT MICROSECOND('2022-01-01 12:10:23.0004');
```

![Screen_Shot_2022-04-11_at_11 16 09_AM](https://user-images.githubusercontent.com/54128055/162738918-c3b18a9c-83e4-49f4-bd98-0c61634c72a9.png)

- QUARTER()
    - 날짜가 몇 분기인지 반환하는 함수

```sql
SELECT QUARTER('2022-01-01 12:10:23')
		 , QUARTER('2022-04-01 12:10:23')
		 , QUARTER('2022-07-01 12:10:23')
     , QUARTER('2022-10-01 12:10:23');
```

![Screen_Shot_2022-04-11_at_11 19 34_AM](https://user-images.githubusercontent.com/54128055/162738920-bac8e997-37e1-4a0d-9400-f19c7bfa5e89.png)

### 날짜 / 시간 계산 함수


- ADDTIME(expr, expr2)
    - TIME 혹은 DATETIME 형식의 expr 에 TIME 형식의 expr2 를 더하여 반환

```sql
SELECT ADDTIME('2022-01-01 12:00:00', '3:00:00');
```

![Screen Shot 2022-04-12 at 10.19.47 AM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ba397fae-90af-4b40-b743-366e9f22d73c/Screen_Shot_2022-04-12_at_10.19.47_AM.png)

- SUBTIME(expr, expr2)
    - TIME 혹은 DATETIME 형식의 expr 에 TIME 형식의 expr2 를 빼고 반환

```sql
SELECT SUBTIME('2022-01-01 12:00:00', '3:00:00');
```

![Screen Shot 2022-04-12 at 11.50.10 AM.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/47c17a14-bd1e-4e07-867e-c5c7b9dea694/Screen_Shot_2022-04-12_at_11.50.10_AM.png)


- DATE_ADD(date, INTERVAL expr)
    - date 에 expr 값을 더하여 반환하는 함수
    - date 는 DATETIME 혹은 DATE 의 형식
    - expr 은 월, 일, 시간, 분, 초 등의 계산될 값의 형시
    - expr 인자에 ‘-’ 부여시 뺄셈도 가능

```sql
SELECT DATE_ADD('2022-01-01 12:00:00', INTERVAL 1 DAY)
		 , DATE_ADD('2022-01-01 12:00:00', INTERVAL -1 DAY);
```

