-- DML
-- select ~  = query
-- select 문은 크게 select from where order by 절로 구성
-- select 절에는 보고자 하는 columns, from 절에는 table을 명시
-- 기존 table의 column 순서는 처음 생성된 순서대로 표현
-- where 절은 조건에 만족해여 출력된다


SELECT *
FROM EMPLOYEES;

-- sql 에서는 != 와 <> 같은 의
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID <> 100;

SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID != 100;


-- sql 에서는 작은 따옴표 사용, 문자열 비교시 
SELECT * 
FROM EMPLOYEES
WHERE EMPLOYEE_ID > 100
AND JOB_ID = 'ST_CLERK';

SELECT *
FROM EMPLOYEES 
WHERE SALARY >= 5000;

SELECT *
FROM EMPLOYEES
WHERE SALARY <= 2400
OR SALARY >= 20000;


--order by: default 는 오름차순(asc)
-- 첫 조건 순으로 정렬, 첫 조건내에서 같은 값들은 두번째 조건으로 정
SELECT *
FROM EMPLOYEES
ORDER BY FIRST_NAME, LAST_NAME;
-- first_name 은 asc순으로 정렬되고, last name 은 desc순으로 정렬됨
SELECT *
FROM EMPLOYEES
ORDER BY FIRST_NAME, LAST_NAME DESC;

SELECT EMPLOYEE_ID, LAST_NAME ,FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY >= 5000
ORDER BY SALARY DESC;

-- order by 2,3 desc : 여기서 숫자는 select 절의 선택된 column의 2번째 column, 3은 3번째 column을 의미
SELECT * 
FROM EMPLOYEES
ORDER BY 2,3,5;

-- oracle 에서는 null 값다이 가장 크다
SELECT * 
FROM EMPLOYEES
ORDER BY COMMISSION_PCT NULLS FIRST;

-- 편리성을 위해 참인 조건을 where 절 뒤에 넣음
SELECT *
FROM EMPLOYEES
WHERE 1=1
AND JOB_ID = 'SA_REP'
AND SALARY >= 5000;


---------------------------------------------------------
-- 연산자

SELECT 1+1, 1-1
FROM dual;

-- " plus_test": alias, column 명으로 표현 기본 문법은 1+1 AS plus_test
SELECT 1+1 plus_test, 1-1 minus_test
FROM dual;

-- 문자열 결합, 문자 중간에 무었으로 묶을지 가능
SELECT first_name ||' '|| last_name AS full_name
FROM employees;


SELECT *
FROM employees
WHERE salary >= 3000
AND salary <= 5000;

SELECT *
FROM employees
WHERE salary BETWEEN 3000
                 AND 5000;
                 


SELECT *
    FROM employees
WHERE NOT(salary = 2500)
ORDER BY salary;


-- NULL 연산자: IS NULL, IS NOT NULL
-- 오라클에서는 NULL과 empty string('')을 동일시함, 타 sql은 고유 값으로 인식
SELECT *
FROM employees
WHERE commission_pct IS NULL;

-- 기타 연산자 LIKE: 문자열 비교
-- ex) last_name like 'da%'
--     last_name like '%d'
SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME LIKE '%da';

SELECT * 
FROM EMPLOYEES
WHERE PHONE_NUMBER LIKE '011%';




-- in 연산자, OR 조건과 같다
SELECT *
FROM EMPLOYEES
WHERE JOB_ID IN ('IT_PROG', 'AD_VP', 'FI_ACCOUNT');

SELECT *
FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG'
OR JOB_ID = 'AD_VP'
OR JOB_ID = 'FI_ACCOUNT';

-- not in 연산자, and 조건과 같다
SELECT *
FROM employees
WHERE job_id NOT IN ('IT_PROG', 'AD_VP', 'FI_ACCOUNT');

---SQL expression
-- 1개 이상의 값, 연산자, 컬럼, sql 함수가 결합된 식
-- select, where, order by 절 등에서 사용됨

---- case 표현식 if ~ then ~ else
---- if 문과 비슷??
-- 반환되는 값의 데이터 타입이 "모두" 같아야함

SELECT COUNTRY_ID, COUNTRY_NAME,
    CASE REGION_ID WHEN 1 THEN 'EUROPE'
                   WHEN 2 THEN 'AMERICA'
                   WHEN 3 THEN 'ASIA'
                   WHEN 4 THEN 'MIDEAST&AFRICA'
    END AS REGION_NAME
FROM COUNTRIES;


SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY, JOB_ID,
    CASE WHEN SALARY BETWEEN 1     AND 5000  THEN 'LOW'
         WHEN SALARY BETWEEN 5001  AND 10000 THEN 'MIDDLE'
         WHEN SALARY BETWEEN 10001 AND 15000 THEN 'HIGH'
         ELSE 'OUTLIER'
    END AS SALARY_RANK
FROM EMPLOYEES;

/* ORACLE 에서 제공하는 rownum 의사컬럼은 가상 컬럼이지만 실제 컬럼 처럼 동작하며 조회된
각 로우에 대한 순번을 반환한다 */
    
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, ROWNUM
FROM EMPLOYEES
WHERE ROWNUM <= 5;


