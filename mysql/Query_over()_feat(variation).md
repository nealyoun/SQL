# Query: over() (feat. variance)

URL: [https://solvesql.com/problems/group-by/](https://solvesql.com/problems/group-by/)

![Screen Shot 2022-04-15 at 10.40.19 AM.png](Query%20over%20621be/Screen_Shot_2022-04-15_at_10.40.19_AM.png)

### Deviation, 편차

- points 라는 테이블의 구조를 보면 quartet의 종류는 I,II,III,III 으로 4가지
- quartet 별로 x, y 값이 존재

```sql
SELECT * 
FROM points;
```

![Screen Shot 2022-04-15 at 10.44.03 AM.png](Query%20over%20621be/Screen_Shot_2022-04-15_at_10.44.03_AM.png)

- 모든 x 값에 대하여 x 의 평균값과의 편차를 보고자 할때 over() 함수를 쓰면 유용
- quartet I의 x 평균은 9
- 편차 column은 각 x에 대하여 평균값인 9를 뺀 값
- **만약 over(partition by quartet) 으로 사용한다면 quartet 별로 x에 대한 평균값이 구해진다**
    - 해당 문제에서는 quartet I,II,III,III 별 x 의 평균이 9로 똑같음

```sql
SELECT
	    quartet,
	    x,
	    avg(x) over() AS 평균,
	    round(x - avg(x) over(), 3) AS 편차
FROM points
```

![Screen Shot 2022-04-15 at 10.52.07 AM.png](Query%20over%20621be/Screen_Shot_2022-04-15_at_10.52.07_AM.png)

### Variance, 분산

- 분산 계산 과정에서 '편차를 모두 더하면 0이 나오므로 제곱해서 더한다'
- 합이 0이 되는지 확인 해보면

```sql
SELECT sum(편차)
FROM (
      SELECT
            (x - avg(x) over ()) AS 편차
      FROM points
      );
```

![Screen Shot 2022-04-15 at 11.02.16 AM.png](Query%20over%20621be/Screen_Shot_2022-04-15_at_11.02.16_AM.png)

- quartet I 내에 있는 x 값들에 대한 분산을 구한다면

```sql
SELECT quartet
     , SUM((deviation * deviation))/(n-1) as variance
FROM (
      SELECT quartet,
            (x - avg(x) over (partition by quartet)) AS deviation,
            (count(x) over(partition by quartet)) AS n
      FROM points
      WHERE quartet = 'I');
```

![Screen Shot 2022-04-15 at 11.22.07 AM.png](Query%20over%20621be/Screen_Shot_2022-04-15_at_11.22.07_AM.png)

- 위에서 구한 분산이 built-in-function 인 variance()를 사용했을 때와 값이 같음을 확인

```sql
SELECT quartet
     , round(variance(x))
FROM points
WHERE quartet = 'I';
```

![Screen Shot 2022-04-15 at 11.23.00 AM.png](Query%20over%20621be/Screen_Shot_2022-04-15_at_11.23.00_AM.png)