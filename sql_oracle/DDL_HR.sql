
--Create Alter Drop table 
 
 create table emp(
    emp_no varchar2(30) not null,
    emp_name varchar2(80) not null,
    salary number null,
    hire_date date null
    );
    
desc emp;
select * from emp;



alter table emp
modify emp_name varchar2(100);

desc emp;

alter table emp
add emp_name2 varchar2(80);

desc emp;

alter table emp
rename column emp_name2
to emp_name3;

desc emp;


alter table emp
drop column emp_name3;
desc emp;

drop table emp;


create table emp(
    emp_no varchar2(30) primary key,
    emp_name varchar2(80) not null,
    salary number,
    hire_date date
    );
desc emp;


create table emp2(
    emp_no varchar2(30),
    emp_name varchar2(100),
    salary number,
    hire_date date,
    primary key(emp_no)
    );
desc emp2;

alter table emp2
modify emp_name not null;
desc emp2;

create table emp3(
    emp_no varchar2(30),
    emp_name varchar2(100) not null,
    salary number,
    hire_date date
    );
desc emp3;

alter table emp3
add constraints emp3_pk primary key(emp_no);
desc emp3;


create table dept_test(
    dept_no number primary key,
    dept_name varchar2(30) not null,
    dept_desc varchar2(100),
    create_date date
    );
desc dept_test;

alter table dept_test
add dept_desc2 varchar2(100);
desc dept_test;

alter table dept_test
drop column dept_desc2;
desc dept_test;

drop table dept_test;
desc dept_test;