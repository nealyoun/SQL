# Subquery_(nested_subquery)

- 메인쿼리의 WHERE 절에 위치
- 서브쿼리가 조건절의 일부로 사용됨
- 서브쿼리 최종 반환 값과 메인쿼리 테이블의 특정 컬럼 값을 비교시 사용
- 서브쿼리가 최종 반환하는 로우와 컬럼, 표현식 수는 1개 이상 가능
- 조건절의 일부이므로 서브쿼리에 대한 alias 사용 불가
- 서브쿼리 내에서 메인쿼리와 조인 가능

```sql
-- job_id, salary 두 값을 동시에 비교
-- job_id 별 최소 급여를 받는 사원이 조회됨
SELECT employee_id
  	 , concat(first_name, last_name)
     , job_id
     , salary
FROM employees
WHERE (job_id, salary) IN (SELECT job_id
																, min_salary
												   FROM jobs)
ORDER BY 1;
```