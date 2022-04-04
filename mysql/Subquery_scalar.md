# Subquery_(scalar subquery)

- 메인쿼리의 SELECT 절에 위치한 서브쿼리
- SELECT 절에서 마치 하나의 컬럼이나 표현식 처럼 사용
- 서브쿼리가 최종 반환하는 로우 수는 1개
- 서브쿼리가 최종 반환하는 컬럼이나 표현식도 1개
- Alias를 붙여주는 것이 일반 적 → 하나의 컬럼 역할을 하므로
- 서브쿼리 내에서 메인쿼리와 조인 가능
    - 조인 하는 것이 일반적
    - 조인을 안 하면 여러 건이 조회될 가능성이 많음

```sql
SELECT e.employee_id
	 , concat(e.first_name, e.last_name) emp_name
     , e.department_id
     , (SELECT d.department_id
        FROM departments as d
        WHERE e.department_id = d.department_id) dept_name
FROM employees as e
ORDER BY 1;
```

![Screen_Shot_2022-04-01_at_9 04 26_AM](https://user-images.githubusercontent.com/54128055/161455047-aa748cfa-3789-4ac3-9785-31f71f4a9184.png)

```sql
-- 메인쿼리와 조인을 하지 않은 경우 예시
SELECT e.employee_id
	 , concat(e.first_name, e.last_name) emp_name
     , e.department_id
     , (SELECT d.department_id
        FROM departments as d) dept_name
FROM employees as e
ORDER BY 1;
```

Error Code: 1242. Subquery returns more than 1 row

---

```sql
-- job_title, job_id 두 컬럼을 사용하지만, 문자열 결합으로 최종 반환 값은 1개
SELECT e.employee_id
		 , concat(e.first_name, e.last_name)
     , (SELECT concat(j.job_title, '(', j.job_id, ')')
				FROM jobs j
        WHERE e.job_id = j.job_id) job_names
FROM employees as e
ORDER BY 1;
```

![Screen_Shot_2022-04-01_at_9 35 41_AM](https://user-images.githubusercontent.com/54128055/161455048-ac2af2dd-9240-41f0-8cc7-6e73930b7ba6.png)

```sql
-- 건수는 1건을 가져오지만, 두 개의 컬럼 값을 가져오므로 오류
SELECT e.employee_id
		 , concat(e.first_name, e.last_name) emp_name
     , e.department_id
     , (SELECT d.department_id
						 , d.location_id
        FROM departments as d) dept_name
FROM employees as e
ORDER BY 1;
```

Error Code: 1241. Operand should contain 1 column(s)
