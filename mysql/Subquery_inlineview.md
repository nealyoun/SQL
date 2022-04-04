# Subquery_(inline view)

- 메인쿼리의 FROM 절에 위치
- 서브쿼리 자체가 마치 하나의 테이블 처럼 동작
- 서브쿼리가 최종 반환하는 로우와 컬럼, 표현식 수는 1개 이상 가능
- 서브쿼리에 대한 alias는 반드시 명시
- 메인쿼리와 조인조건은 메인 쿼리의 WHERE 절에서 처리가 일반적
    - LATERAL 키워드 사용 시 서브쿼리 내에서 조인 가능 → 스칼라 서브쿼리처럼 동작
    

```sql
SELECT e.employee_id
	   , concat(e.first_name, e.last_name)
     , e.department_id
     , dept.dept_name
FROM employees as e
	  ,(SELECT d.department_id
						,d.department_name as dept_name
	    FROM departments d) dept
WHERE e.department_id = dept.department_id
ORDER BY 1;
```

![Screen_Shot_2022-04-01_at_10 01 36_AM](https://user-images.githubusercontent.com/54128055/161455087-2f0706e7-346c-40df-b1d6-3b5a14dddb8e.png)

```sql
-- LATERAL 사용시 서브쿼리 내에서 메인쿼리(혹은 쿼리내 다른 서브쿼리)와 조인 가능
SELECT e.employee_id
	   , concat(e.first_name, e.last_name)
     , e.department_id
     , dept.dept_name
FROM employees as e
	   ,LATERAL
     (SELECT d.department_id
						,d.department_name as dept_name
	    FROM departments d
      WHERE d.department_id = e.department_id) dept
ORDER BY 1;
```
