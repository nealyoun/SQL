--CTE or With
--서브 쿼리의 일종
--with 절(clause) 혹은 CTE(common table expression)라고 함
--가독성이 일반적인 inline view 보다 좋음
--oracle 내에서 with 절은 내부적으로 temp table space를 사용
--    과도한 with clause 사용시 temp table space를 점유해 성능에 좋지 않다
--    일반적인 경우에는 서브 쿼리를 사용하고, 서브쿼리 사용이 수월치 않은 경우 with 절 사용을 추천
--
--with 별칭 as 다음에 subquery 형태
--subquery 내의 from 절에서 ekfms subquery 별칭을 기술해 inline view 처럼 사용가능

with dept as(
select department_id, department_name dept_name
from departments
)
select a.employee_id
     , a.first_name||' '||a.last_name
from employees a
     , dept b
where a.department_id = b.department_id
order by 1;




with dept_loc as(
select a.department_id
     , a.department_name dept_name
     , b.location_id
     , b.street_address
     , b.country_id
from departments a
join locations b
    on a.location_id = b.location_id
),
cont as(
select a.department_id
     , a.dept_name
     , a.street_address street_name
     , b.country_id
     , b.country_name
from dept_loc a
join countries b
    on a.country_id = b.country_id
)
select a.employee_id
     , a.first_name||' '||a.last_name
     , b.dept_name
     , b.street_name
     , b.country_name
from employees a
join cont b
    on a.department_id = b.department_id
order by 1;




