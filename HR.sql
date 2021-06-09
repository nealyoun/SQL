create table emp(
    emp_no varchar2(30) primary key,
    emp_name varchar2(80) not null,
    salary number,
    hire_date date
    );
    
select * 
from emp;

desc emp;

alter table emp
modify emp_no varchar2(40)
add emp_name2 varchar2(100);

desc emp;

/* rename emp to emp2;
desc emp2; */

drop table emp2;


create table emp2(
    emp_no varchar2(30),
    emp_name varchar2(80) not null,
    salary number null,
    hire_date date null,
    primary key(emp_no)
);

desc emp2;


--drop table emp;