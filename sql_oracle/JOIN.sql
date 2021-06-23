--JOIN

-- 조인에 참여하는 테이블 간 같은 값을 가진 컬럼 -> '조인 컬럼'
-- 조인 컬럼은 한 개 이상으로 구성될 수 있고 뷰(view)도 조인도 가능

-- Inner Join -------------------------------------------------
-- 조인 참여 테이블 간 조인 컬럼 값이 같은 건을 가져옴
-- where 절에서 각 테이블의 조인 컬럼과 연산자를 사용해 조건 명시 -> '조인 조건'

-- 테이블명.컬명 혹은 alias.컬럼명으로 가져와야함
-- 조인 조건 외 추가적인 조건은 filter 조건이라 한다 ex) department_id = 30
select a.employee_id
     , a.first_name
     , a.last_name
     , a.department_id
     , b.department_name
from employees a,
     departments b
where a.department_id = b.department_id
order by a.department_id;



select a.employee_id
     , b.job_title
     , c.department_id, c.department_name
     , d.street_address, d.city
     , e.country_name
     , f.region_name
from employees a
    , jobs b
    , departments c
    , locations d
    , countries e
    , regions f
    
where a.job_id = b.job_id
    and a.department_id = c.department_id
    and c.location_id = d.location_id
    and d.country_id = e.country_id
    and e.region_id = f.region_id
    and c.department_id = 30; -- 해당 조건은 filter 조건;
    


-- Outer Join ------------------------------------------
--조인 조건을 만족하는 것은 물론 만족하지 않는 데이터(row)까지 포함해 조회
-- (+) 기호는 오라클 외부 조인 제약사항, 타 sql 언어에서는 사용 불가능
-- 3개의 테이블을 조인하는데 a와 b는 외부조인 b와 c는 내부조인으로 한다면 누락되는 값이 있을 수 있음 따라서 조인조건 (+)를 모두 붙여야 제대로 조회 가능


select a.employee_id
     , a.first_name
     , a.last_name
     , a.department_id
     , b.department_name
from employees a,
     departments b
where a.department_id = b.department_id (+)
order by a.department_id;

select a.employee_id
     , a.first_name
     , a.last_name
     , a.department_id
     , b.department_name
from employees a,
     departments b
where a.department_id(+) = b.department_id
order by a.department_id;

-- ANSI Join ------------------------------------------
--inner, outer join을 ANSI 문법에 맞게 작성한 쿼리
--조인 조건 절을 where 절이 아닌 from 절에 기술
-- 보통 left join이 많이 사용된다.
----------------------------------------------------------
select a.employee_id
     , a.first_name
     , a.last_name
     , a.department_id
     , b.department_name
from employees a,
     departments b
where a.department_id = b.department_id
order by a.department_id;
----위 아래의 결과는 같음;
select a.employee_id
     , a.first_name
     , a.last_name
     , a.department_id
     , b.department_name
from employees a
inner join departments b
on a.department_id = b.department_id
order by a.department_id;
-----------------------------

--Left outer join
select a.employee_id
     , a.first_name
     , a.last_name
     , a.department_id
     , b.department_name
from employees a
left outer join departments b
on a.department_id = b.department_id
order by a.department_id;
--right outer join
select a.employee_id
     , a.first_name
     , a.last_name
     , a.department_id
     , b.department_name
from employees a
right outer join departments b
on a.department_id = b.department_id
order by a.department_id;

--Full outer join
select a.employee_id
     , a.first_name
     , a.last_name
     , a.department_id
     , b.department_name
from employees a
full outer join departments b
on a.department_id = b.department_id
order by a.department_id;


--SELF JOIN---------------
select a.employee_id
     , a.first_name ||' '|| a.last_name
     , a.manager_id
     , b.first_name ||' '|| b.last_name
from employees a
inner join employees b
    on a.manager_id = b.employee_id
order by 1;

desc employees;
