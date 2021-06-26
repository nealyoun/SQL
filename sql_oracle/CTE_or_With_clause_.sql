--CTE or With
--서브 쿼리의 일종
--with 절(clause) 혹은 CTE(common table expression)라고 함
--가독성이 일반적인 inline view 보다 좋음
--oracle 내에서 with 절은 내부적으로 temp table space를 사용
--    과도한 with clause 사용시 temp table space를 점유해 성능에 좋지 않다
--    일반적인 경우에는 서브 쿼리를 사용하고, 서브쿼리 사용이 수월치 않은 경우 with 절 사용을 추천
--    
select sql_id, sql_text

from v$sql;