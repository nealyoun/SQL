# Query: over() (feat. variance)

URL: [https://solvesql.com/problems/group-by/](https://solvesql.com/problems/group-by/)

![Screen_Shot_2022-04-15_at_10 40 19_AM](https://user-images.githubusercontent.com/54128055/163584887-d6255d5e-7a78-494e-8102-2c78cc60ef13.png)

### Deviation, 편차

- points 라는 테이블의 구조를 보면 quartet의 종류는 I,II,III,III 으로 4가지
- quartet 별로 x, y 값이 존재

```sql
SELECT * 
FROM points;
```

![Screen_Shot_2022-04-15_at_10 44 03_AM](https://user-images.githubusercontent.com/54128055/163584892-161dfdc1-95e5-4b3b-aa04-a5723eef6425.png)

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

![Screen_Shot_2022-04-15_at_10 52 07_AM](https://user-images.githubusercontent.com/54128055/163584893-694046a6-7626-4b01-b968-8f551a63dbd5.png)

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

![Screen_Shot_2022-04-15_at_11 02 16_AM](https://user-images.githubusercontent.com/54128055/163584897-dc6c2b22-3c52-4c22-88c5-14780813f2c3.png)

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

![Screen_Shot_2022-04-15_at_11 22 07_AM](https://user-images.githubusercontent.com/54128055/163584898-73d93a5e-87b1-4b3e-834f-7cd74fa10dc9.png)

- 위에서 구한 분산이 built-in-function 인 variance()를 사용했을 때와 값이 같음을 확인

```sql
SELECT quartet
     , round(variance(x))
FROM points
WHERE quartet = 'I';
```

![Screen_Shot_2022-04-15_at_11 23 00_AM](https://user-images.githubusercontent.com/54128055/163584899-bfc7396c-46f7-4bf8-bdd4-b91b8a14edf6.png)
