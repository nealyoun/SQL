# Num_Functions

- ABS(n)
    - 절대값 반환

```sql
SELECT ABS(-10);
```

![Screen_Shot_2022-04-06_at_9 32 04_AM](https://user-images.githubusercontent.com/54128055/161879936-943a62a5-0eb7-45f9-b29d-27b3fb5109e4.png)
<br/><br/><br/>
--
- CEIL(n), CEILING(n)
    - n 의 올림값 반환

```sql
SELECT CEIL(5.5);
```

![Screen_Shot_2022-04-06_at_9 33 25_AM](https://user-images.githubusercontent.com/54128055/161879939-c8a18a1c-926b-493a-9079-1ca0d56b3f9c.png)
<br/><br/>
- FLOOR(n)
    - n 의 내림값 반환

```sql
SELECT ABS(-10);
```

![Screen_Shot_2022-04-06_at_9 35 58_AM](https://user-images.githubusercontent.com/54128055/161879941-e730fcc1-a0e2-4910-b1af-0ed7581798c4.png)
<br/><br/>
- ROUND(n), ROUND(n1, n2)
    - n 을 반올림하여 반환
    - n2 생략시 정수로 반올림
    - CEIL 혹은 FLOOR 는 무조건 올림, 내림이지만 ROUND는 말그대로 반올림
        - 5.5 → 6, 5.1 → 5

```sql
SELECT ROUND(5.1)
		 , ROUND(5.5);
```

![Screen_Shot_2022-04-06_at_9 41 16_AM](https://user-images.githubusercontent.com/54128055/161879946-dbad8246-9252-4f9c-88a8-4fe5e69e4527.png)
<br/><br/>
- TRUNCATE(n1, n2)
    - n1 의 소숫점을 기준으로 n2 자리에서 절사 (반올림을 하지 않음)

```sql
SELECT TRUNCATE(3.14159, 3)
		 , ROUND(3.14159, 3);
```

![Screen_Shot_2022-04-06_at_10 15 44_AM](https://user-images.githubusercontent.com/54128055/161879950-2c8cf9c7-cad2-4a0d-a4cd-b9654e804e4f.png)

```sql
SELECT TRUNCATE(33.14, -1);
```

![Screen_Shot_2022-04-06_at_9 52 07_AM](https://user-images.githubusercontent.com/54128055/161879947-55d12485-77cb-4ae8-be16-919584db93f8.png)
<br/><br/>
- FORMAT(n1, n2)
    - n1 을 소숫점 자릿수인 n2 로 반올림하며, 1000 단위마다 콤마를 표시하여 반환

```sql
SELECT FORMAT(1000000.654321, 2);
```

![Screen_Shot_2022-04-06_at_9 57 43_AM](https://user-images.githubusercontent.com/54128055/161879948-fac25ab7-51f7-47d6-88dc-cd9cce6ab5e2.png)
<br/><br/><br/>
--
- SIGN(n)
    - n 이 양수인지, 음수인지, 0 인지 표현
    - 양수: 1, 음수: -1, 0: 0

```sql
SELECT SIGN(-10)
		 , SIGN(0)
     , SIGN(10);
```

![Screen_Shot_2022-04-06_at_10 06 34_AM](https://user-images.githubusercontent.com/54128055/161879949-e97f86ed-c9de-4f0f-88cd-ce9b92f9ad78.png)
<br/><br/><br/>
--
- EXP(n), LN(n)
    - EXP 는 지수 함수로 자연지수 e 의 n 제곱값 반환
    - LN 은 자연 로그 함수로 밑이 e 인 로그 함수

```sql
SELECT EXP(5)
		 , LN(EXP(5));
```

![Screen_Shot_2022-04-06_at_10 26 24_AM](https://user-images.githubusercontent.com/54128055/161879951-4b338b26-0815-49c2-afa0-550cdb2e0099.png)
<br/><br/>
- LOG(n2, n1)
    - n2 를 밑으로 하는 n1 의 로그 값 반환

```sql
SELECT LOG(2, 32);
```

![Screen_Shot_2022-04-06_at_10 28 07_AM](https://user-images.githubusercontent.com/54128055/161879953-95971e62-4341-45d6-a899-5aa92b8253d3.png)
<br/><br/><br/>
--
- POWER(n1, n2), POW(n1, n2)
    - n1 의 n2 제곱값을 반환

```sql
SELECT POWER(5, 2);
```

![Screen_Shot_2022-04-06_at_10 33 53_AM](https://user-images.githubusercontent.com/54128055/161879956-9e9621e4-2c1f-4851-b0fb-47ca1fef0ae3.png)
<br/><br/>
- SQRT(n)
    - n 의 제곱근을 반환
    - n 의 값은 0 이상의 값이어야하며, 0 보다 작을 경우 NULL을 반환

```sql
SELECT SQRT(25)
		 , SQRT(-5);
```

![Screen_Shot_2022-04-06_at_10 47 23_AM](https://user-images.githubusercontent.com/54128055/161879957-1d86bfbd-8f13-4155-a61a-07b9f3cde960.png)
<br/><br/><br/>
--
- MOD(n1, n2), n1 MOD n2, N % M
    - n1 을 n2 로 나눈 후 나머지를 반환

```sql
SELECT MOD(25, 4)
		 , 25 MOD 4
     , 25 % 4;
```

![Screen_Shot_2022-04-06_at_10 49 28_AM](https://user-images.githubusercontent.com/54128055/161879958-c33a7b40-de4f-4efa-bc15-525e5ea734ba.png)
