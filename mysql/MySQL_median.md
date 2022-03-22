# MySQL: median (Oracle)

![Untitled](https://user-images.githubusercontent.com/54128055/159484431-3517aa0c-7bb5-4cdf-9d87-9992c4c558bc.png)

### Oracle: Median

```sql
SELECT MEDIAN(LAT_N,4)
FROM STATION;
```

Oracle 을 이용한다면 built-in function으로 median 함수를 제공하기 때문에 쉽게 구할 수 있다

하지만 MySQL 에서는 median을 구할 수 있는 built-in function 이 따로 없기 때문에 직접 구해야한다

### MySQL: Median

```sql
SELECT LAT_N
FROM (SELECT LAT_N
	   , PERCENT_RANK() OVER(ORDER BY LAT_N) AS PERCENTILE
      FROM STATION) 
WHERE PERCENTILE = 0.5;
```

PERCENT_RANK() 하는 함수를 이용해서 해당 변수의 백분위수를 구하여 0.5에 해당하는 값을 불러오는 것
