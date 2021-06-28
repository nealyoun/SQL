-- Analytuc Function, 분석 함수
--분석 함수 구문, select 절에서 사용
-- group by 절 사용시, 집계 대상에 따라 row 수가 줄어들지만, 분석함수는 row 수는 그대로 집계 값 산출 가능

-- rank 같은 순위가 존재, ex) 1,2,3,3,4

-- dense_rank 누적 순위 rank와는 다르게 ex) 1,2,3,3,5

-- lead 해당 컬럼의(같은 그룹에 속한) 다음 row의 값을 읽어 오는 함수
-- lag 선행 로우값, lead의 반대



-- row_number, rank, dense_rank
select b.department_id
     , b.department_name
     , a.first_name ||' '|| a.last_name emp_name
     , row_number() over
            (partition by b.department_id
             order by a.salary) dept_sal_seq
     , a.salary
from employees a
join departments b
    on a.department_id = b.department_id
order by 2, 4;


select b.department_id
     , b.department_name
     , a.first_name ||' '|| a.last_name emp_name
     , row_number() over
            (partition by b.department_id
             order by a.salary desc) dept_sal_seq
     , a.salary
     
from employees a
join departments b
    on a.department_id = b.department_id
order by 2,4;

select b.department_id
     , b.department_name
     , a.first_name ||' '|| a.last_name emp_name
     , row_number() over
            (order by a.salary desc) emp_sal_seq
            
     , a.salary
from employees a
join departments b
    on a.department_id = b.department_id
order by 4;



select b.department_id
     , b.department_name
     , a.first_name ||' '|| a.last_name emp_name
     , rank() over
            (partition by b.department_id
                order by a.salary desc) dept_sal_rank
     , a.salary
from employees a
join departments b
    on a.department_id = b.department_id
order by 2,4;



select b.department_id
     , b.department_name
     , a.first_name ||' '|| a.last_name emp_name
     , dense_rank() over
            (partition by b.department_id
                order by a.salary desc) dept_sal_dense_rank
     , a.salary
from employees a
join departments b
    on a.department_id = b.department_id
order by 2,4;
    
------------------------------------------------------------

--Lead(expr), Lag(expr)

select b.department_id
     , b.department_name
     , a.first_name ||' '|| a.last_name emp_name
     , a.hire_date
     , a.salary
     , lead(salary) over
            (partition by b.department_id
                order by a.hire_date ) lead_salary

from employees a
join departments b
     on a.department_id = b.department_id
order by 2,4;


select b.department_id
     , b.department_name
     , a.first_name ||' '|| a.last_name emp_name
     , a.hire_date
     , a.salary
     , lead(salary, 1, 0) over (partition by b.department_id
                                    order by a.hire_date) lead_salary
from employees a
join departments b
    on a.department_id = b.department_id
order by 2,4;

select b.department_id
     , b.department_name
     , a.first_name ||' '|| a.last_name emp_name
     , a.hire_date
     , a.salary
     , lead(salary,2, 0) over (partition by b.department_id
                                    order by a.hire_date) lead_salary
from employees a
join departments b
    on a.department_id = b.department_id
order by 2,4;

select b.department_id
     , b.department_name
     , a.first_name ||' '|| a.last_name emp_name
     , a.hire_date
     , a.salary
     , lag(salary) over (partition by b.department_id
                                    order by a.hire_date) lead_salary
from employees a
join departments b
    on a.department_id = b.department_id
order by 2,4;


select b.department_id
     , b.department_name
     , a.first_name ||' '|| a.last_name emp_name
     , a.hire_date
     , lag(salary,1,0) over(partition by b.department_id
                                    order by a.hire_date) lag_salary
     , a.salary
     , lead(salary,1,0) over(partition by b.department_id
                                    order by a.hire_date) lead_salary

from employees a
join departments b
    on a.department_id = b.department_id
order by 2, 4;

------------------------------------------------------------------------
-- 분석 함수 집계 쿼리

select b.department_id
     , b.department_name 
     , a.first_name ||' ' || a.last_name emp_name
     , a.salary
     , round(avg(a.salary) over(partition by b.department_id
                                    order by b.department_id), 0) dept_avg_sal
from employees a
join departments b
    on a.department_id = b.department_id
order by 2, 4;
                                    

select b.department_id
     , b.department_name
     , a.first_name ||' ' ||a.last_name
     , a.salary
     , round(sum(a.salary) over(partition by b.department_id
                            order by a.salary), 0) dept_cum_sal
from employees a
join departments b
    on a.department_id = b.department_id
order by 2,4;


select b.department_id
     , b.department_name
     , a.first_name ||' ' ||a.last_name emp_name
     , a.salary
     , round(ratio_to_report(a.salary) 
                over(partition by b.department_id),2) rates
                
from employees a
join departments b
    on a.department_id = b.department_id
order by 2,4 desc;




select b.department_id
     , b.department_name
     , a.first_name ||' ' ||a.last_name
     , a.salary
     , sum(a.salary) over(partition by b.department_id
                            order by a.salary) dept_cum_sal
from employees a
join departments b
    on a.department_id = b.department_id
order by 2,4;





