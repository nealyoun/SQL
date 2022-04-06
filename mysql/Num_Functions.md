# Num_Functions

- ABS(n)
    - 절대값 반환

```sql
SELECT ABS(-10);
```

![Screen Shot 2022-04-06 at 9.32.04 AM.png](Num_Functi%2050dc6/Screen_Shot_2022-04-06_at_9.32.04_AM.png)

- CEIL(n), CEILING(n)
    - n 의 올림값 반환

```sql
SELECT CEIL(5.5);
```

![Screen Shot 2022-04-06 at 9.33.25 AM.png](Num_Functi%2050dc6/Screen_Shot_2022-04-06_at_9.33.25_AM.png)

- FLOOR(n)
    - n 의 내림값 반환

```sql
SELECT ABS(-10);
```

![Screen Shot 2022-04-06 at 9.35.58 AM.png](Num_Functi%2050dc6/Screen_Shot_2022-04-06_at_9.35.58_AM.png)

- ROUND(n), ROUND(n1, n2)
    - n 을 반올림하여 반환
    - n2 생략시 정수로 반올림
    - CEIL 혹은 FLOOR 는 무조건 올림, 내림이지만 ROUND는 말그대로 반올림
        - 5.5 → 6, 5.1 → 5

```sql
SELECT ROUND(5.1)
		 , ROUND(5.5);
```

![Screen Shot 2022-04-06 at 9.41.16 AM.png](Num_Functi%2050dc6/Screen_Shot_2022-04-06_at_9.41.16_AM.png)

- TRUNCATE(n1, n2)
    - n1 의 소숫점을 기준으로 n2 자리에서 절사 (반올림을 하지 않음)

```sql
SELECT TRUNCATE(3.14159, 3)
		 , ROUND(3.14159, 3);
```

![Screen Shot 2022-04-06 at 10.15.44 AM.png](Num_Functi%2050dc6/Screen_Shot_2022-04-06_at_10.15.44_AM.png)

```sql
SELECT TRUNCATE(33.14, -1);
```

![Screen Shot 2022-04-06 at 9.52.07 AM.png](Num_Functi%2050dc6/Screen_Shot_2022-04-06_at_9.52.07_AM.png)

- FORMAT(n1, n2)
    - n1 을 소숫점 자릿수인 n2 로 반올림하며, 1000 단위마다 콤마를 표시하여 반환

```sql
SELECT FORMAT(1000000.654321, 2);
```

![Screen Shot 2022-04-06 at 9.57.43 AM.png](Num_Functi%2050dc6/Screen_Shot_2022-04-06_at_9.57.43_AM.png)

- SIGN(n)
    - n 이 양수인지, 음수인지, 0 인지 표현
    - 양수: 1, 음수: -1, 0: 0

```sql
SELECT SIGN(-10)
		 , SIGN(0)
     , SIGN(10);
```

![Screen Shot 2022-04-06 at 10.06.34 AM.png](Num_Functi%2050dc6/Screen_Shot_2022-04-06_at_10.06.34_AM.png)

- EXP(n), LN(n)
    - EXP 는 지수 함수로 자연지수 e 의 n 제곱값 반환
    - LN 은 자연 로그 함수로 밑이 e 인 로그 함수

```sql
SELECT EXP(5)
		 , LN(EXP(5));
```

![Screen Shot 2022-04-06 at 10.26.24 AM.png](Num_Functi%2050dc6/Screen_Shot_2022-04-06_at_10.26.24_AM.png)

- LOG(n2, n1)
    - n2 를 밑으로 하는 n1 의 로그 값 반환

```sql
SELECT LOG(2, 32);
```

![Screen Shot 2022-04-06 at 10.28.07 AM.png](Num_Functi%2050dc6/Screen_Shot_2022-04-06_at_10.28.07_AM.png)

- POWER(n1, n2), POW(n1, n2)
    - n1 의 n2 제곱값을 반환

```sql
SELECT POWER(5, 2);
```

![Screen Shot 2022-04-06 at 10.33.53 AM.png](Num_Functi%2050dc6/Screen_Shot_2022-04-06_at_10.33.53_AM.png)

- SQRT(n)
    - n 의 제곱근을 반환
    - n 의 값은 0 이상의 값이어야하며, 0 보다 작을 경우 NULL을 반환

```sql
SELECT SQRT(25)
		 , SQRT(-5);
```

![Screen Shot 2022-04-06 at 10.47.23 AM.png](Num_Functi%2050dc6/Screen_Shot_2022-04-06_at_10.47.23_AM.png)

- MOD(n1, n2), n1 MOD n2, N % M
    - n1 을 n2 로 나눈 후 나머지를 반환

```sql
SELECT MOD(25, 4)
		 , 25 MOD 4
     , 25 % 4;
```

![Screen Shot 2022-04-06 at 10.49.28 AM.png](Num_Functi%2050dc6/Screen_Shot_2022-04-06_at_10.49.28_AM.png)