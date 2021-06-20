--집계 쿼리
--groupby 와 집계 함수
--특정 column 별 최소 최대 평균 값 등


--group by 절에 기술한 컬럼, 표현식 이외의 항목은 select 절에 명시 불가
-- where 와 order by 절 사이에 위치

-- 집계함수: count(), max(), min(), 등
-- 집계함수가 반환한 값은 where 절에 사용할 수 없다 => having 절 
-- 일반적인 조건 -> where 절, having 절 -> 집계 쿼리에 대한 추가 조건절

select job_id
from employees
group by job_id;

select to_char(hire_date, 'yyyy')
from employees
group by to_char(hire_date, 'yyyy');


-- 전제 row의 개수
select count(*)
from employees;

-- 기본적인 집계 쿼리
select job_id,
       count(*) total_cnt,
       min(salary) min_salary,
       max(salary) max_salary
from employees
group by job_id
order by job_id;


select to_char(hire_date, 'yyyy') hire_year,
       department_id,
       count(*), sum(salary), avg(salary)
from employees
group by to_char(hire_date, 'yyyy'), department_id
order by 1,2;

select to_char(hire_date, 'yyyy') hire_year,
       department_id,
       count(*), sum(salary), avg(salary)
from employees
where to_char(hire_date, 'yyyy') >= 2004
group by to_char(hire_date, 'yyyy'), department_id
order by 1,2;




--  집계함수가 반환한 값은 where 절에 사용할 수 없다 => having 절 
select to_char(hire_date, 'yyyy') hire_year,
       department_id,
       count(*), sum(salary), avg(salary)
from employees
--where avg(salary) >= 5000
group by to_char(hire_date, 'yyyy'), department_id
having avg(salary) >= 5000
order by 1,2;

select to_char(hire_date, 'yyyy') hire_year,
       department_id,
       count(*), sum(salary), avg(salary)
from employees
--where avg(salary) >= 5000
group by to_char(hire_date, 'yyyy'), department_id
having count(*) > 1
order by 1,2;

--------------------------------
--distinct

select distinct job_id
from employees;

-- 두 결과가 같음 distict 뒤에 선택된 컬럼의 고유 값이 나온다
select job_id
from employees
group by job_id;

-- rollup, cube
-------------------------------------------------------------------------






--급여가 10000이상인 사원의 평균 급여
select avg(salary)
from employees
where salary >= 10000;

select to_char(hire_date, 'mm'), count(*)
from employees
group by to_char(hire_date, 'mm');

select to_char(hire_date, 'day'), count(*),to_char(hire_date, 'd')
from employees
group by to_char(hire_date, 'day'), to_char(hire_date, 'd')
order by to_char(hire_date, 'd');

select first_name, count(*)
from employees
group by first_name
having count(*) > 1
order by first_name;


