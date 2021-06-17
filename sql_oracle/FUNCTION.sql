------------------------------------------------
-- 사용자 정의 함수
-- PL/SQL을 사용해 개발 (직접 함수 만들어 사용)
-- oracle 기본적인 연산의 함수 제공: built-in function
-- 피연산자와 반환값의 데이터 유형에 따라 크게 문자형 숫자형 날짜형 함수로 구분

-- 숫자형 함수 매개변수, 즉 피연산자와 반환값의 데이터 유형이 숫자인 경우
-- *ABS(n), CEIL(n), FLOOR(n), EXP(n), LN(n), LOG(n2, n1), *MOD(n2,n1), POWER(n2,n1), *ROUND(n,i)
-- SIGN(n), SQRT(n), *TRUNC(n1,n2)

--매개변수가 문자형 함수, 피연산자가 문자형, 반환 결과는 문자형 혹은 숫자형
--CONCAT(char1, char2), INITCAP(chr), *LOWER(chr) *UPPER(chr) LPAD(expr1,n ,expr2)
--RPAD(expr1,n , expr2) LTRIM(expr1, expr2) RTRIM(expr1, expr2) *SUBSTR(chr,n1,n2)
--*TRIM(chr), ASCII(chr), *LENGTH(chr), LENGTHB(chr)
--*REPLACE(chr,serch_str ,rep_str), INSTR(chr1, chr2, n1, n2)

--데이터 형이 DATE 나 TIMESTAMP인 데이터를 대상으로 하는 연산 함수
--*SYSDATE, *ADD_MONTHS(date, n), MONTHS_BETWEEN(date1, date2), LAST_DAY(date), NEXT_DAY(date, expr), 
--ROUND(date, foramt), TRUNC(date, format)
--
--*: 굉장히 자주 사용되는 함수

--숫자형
SELECT
    abs(- 1)
FROM
    dual;

SELECT
    mod(17, 3),
    sign(- 19),
    sign(0)
FROM
    dual;

SELECT
    round(3.545, 2),
    round(3.545, 1),
    trunc(3.545, 2),
    trunc(3.545, 1),
    round(3.345)
FROM
    dual;
    
-- initcap 첫글자가 영어가아니면 그 다음글자를 변환하며 기존의 대문자 글자는 소문자로 변환, lower upper는 한글에 영향X
SELECT
    initcap('ABC'),
    upper('ab나'),
    lower('Aa나'),
    initcap('나abC')
FROM
    dual;


SELECT
    *
FROM
    employees
WHERE
    lower(first_name) = 'david';
    
    
select lpad('abc',5,3)
from dual;

select ltrim('123**', '1234567889')
from dual;

select substr('ABCDEFG',1,2),
       substr('ABCDEFG',0,2),
       substr('ABCDEFG',3,2),
       substr('ABCDEFG',-5,2)
from dual;

select replace('abcdefabccd', 'a', 'qwe')
from dual;
    
select add_months(sysdate, 1),
       add_months(sysdate, 2),
       add_months(sysdate, -1)
from dual;

-- months_between(date1, date2) date1> date2 = 양수
select months_between(sysdate, sysdate + 61),
       months_between(sysdate, '2021-04-15')
from dual;
    
    
select last_day(sysdate), next_day(sysdate, 'monday')
from dual;

SELECT ROUND(SYSDATE, 'yyyy'),
       ROUND(SYSDATE, 'mm'),
       ROUND(SYSDATE, 'Dd'),
       ROUND(SYSDATE, 'hh24'),
       ROUND(SYSDATE, 'mi')
FROM DUAL;

select sysdate, current_date
from dual;
select sessiontimezone, current_date
from dual;

SELECT TRUNC(SYSDATE, 'YYYY'),
       TRUNC(SYSDATE, 'MM'),
       TRUNC(SYSDATE,  'DD'),
       TRUNC(SYSDATE, 'HH24'),
       TRUNC(SYSDATE, 'MI')
FROM DUAL;
    
SELECT
    round(1000000000000 /((to_number(to_char(sysdate, 'YYYY')) - 1) * 365 + to_number(to_char(sysdate, 'DDD'))), 0)
FROM
    dual;

select to_char(sysdate, 'yyy')
from dual;
select 
    to_char(sysdate, 'mon')
from dual;
select to_char(sysdate, 'ddd')
from dual;


select to_char(123456.123456, '999999.9999')
from dual;

select to_date('2021/06/14', 'yyyy/mm/dd')
from dual;

select nvl(null, 2), nvl(1,10)
from dual;

select decode(1,2,3,4,5,6,7),
       decode(1,2,3,4,5,6,79)
from dual;

SELECT
    TO_DATE('2021/06/10', 'yyyy/mm/dd') + 100,
    TO_DATE('2021/06/10', 'yyyy/mm/dd') + 500
FROM
    dual;

SELECT to_number('12345.6789')
FROM dual;

select to_char(123.456),
       to_char(123.456, '999.999')
from dual;
       
select to_char(123.123),
       to_char(123.123,'99,9.999')
from dual;


select sysdate - to_date('0001-01-01','yyyy-mm-dd hh24:mi:ss')
from dual;


