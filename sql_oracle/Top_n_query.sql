Top n Query
MSSQL top 10,
MYSQL limit 10,

Oracle 에서는
where rownum <= 5
where 절에 명시


select ....
from...
where rownum <= 5
order by ... desc;
하지만 해당 where 절에 rownum으로 명시하면
상위 5개가 아닌 rownum으로 추출된 5개를 decesnding 하는 것




oracle 12c 이후 버전
select ...
from....
Order by ..... desc
Fetch First 5 Rows Only => 구문을 통해 상위 5개의 값 추출 가능
                            위에서 order by를 하지 않을 경우 상위 5개 row를 반환

Fetch First 5 Percent Rows Only => 5% 추출
Fetch First 5 Percent Rows Only with ties => 동일 값까지 반환




