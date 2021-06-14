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
