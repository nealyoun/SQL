-- 집합 쿼리
-- select 문이 반환하는 것을 하나의 집합으로 봄
-- 비슷한 성격의 데이터지만 테이블이 다른 경우 집합 연산자로 하나의 결과로 조회할 수 있다
--select
--from 
--where
--집합연산사
--select
--from
--where


---------------제약---------------------
-- 각 select 절의 컬럼 수, 데이터 타입은 동일
-- 최종 반환되는 컬럼 명은 맨 첫 select 절의 컬럼 이름을 따름
-- order by 절은 맨 마지막 select 절에만 붙일 수 있다
-- UNION: 중복 값은 한 개만 조회된다 
-- UNION ALL: 중복 값도 모두 조회됨 ex) 계획 대비 실적, 전년대비 올해 매출
--          : 컬럼을 로우로 변환

-- INTERSECT: 교집합을 조회 (table A 와 table B)
-- MINUS: 선두 집합에만 있는 원소를 가져오는 차집합 개념
--

-- Union
-- Set A
select job_id 
from employees
where 1=1 
and salary between 2000 and 5000
order by job_id;

select distinct job_id
from employees
where salary between 2000 and 5000
order by job_id;
-- Set B
select job_id
from employees
where 1=1
and salary between 5001 and 6000
order by job_id;
--set A set B union
select job_id, salary
from employees
where 1=1 
and salary between 2000 and 5000

Union

select job_id, salary
from employees
where 1=1
and salary between 5001 and 6000
order by job_id;


--set A set B union all
select job_id
from employees
where 1=1 
and salary between 2000 and 5000

Union All

select job_id
from employees
where 1=1
and salary between 5001 and 6000
order by job_id;





바인드 변수 다시
₩





