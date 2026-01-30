# 문제) emp테이블의 20번 부서에 속하는 사원과 30번 부서에 속하는 사원의 직책을 전부 출력하시오. 
#     => (집합연산자 사용) 
-- 1) 20번 부서의 사원 직책 조회하는 select문을 작성하시오 
-- 2) 30번 부서의 사원 직책 조회하는 select문을 작성하시오
-- 3) 그리고 그 결과를 합하시오.

/*
<UNION/UNION ALL 집합연산자>
형식)
     select문1
     UNION [ALL]
     select문2;
     
=> 사용: 서로 다른 두개의 조회문의 결과를 하나의 결과로 합치고 싶을 때 사용.
=> 주의사항) 서로 다른 두개의 조회문의 컬럼수, 자료형은 반드시 일치해야 함.
*/

select job
from  emp
where deptno=20 # 사원수 = 5명

UNION ALL 

select job
from  emp
where deptno=30; # 사원수 = 6명


# ==> UNION ALL 을 유지한 상태에서 직책의 중복된 값을 제거하시오
# UNION ALL 은 단순히 결과를 합산해주는 연산자 
-- SELECT DISTINCT job
-- FROM (
--     SELECT job
--     FROM emp
--     WHERE deptno = 20

--     UNION ALL

--     SELECT job
--     FROM emp
--     WHERE deptno = 30
-- ) t;


select job
from  emp
where deptno=20

UNION  

select job
from  emp
where deptno=30;


# 문제 10번 부서의 사원들에게는 있고 20번 부서의 사원들에게는 없는 직책은?
-- SELECT job
-- from emp
-- where DEPTNO=10
-- minus # MYSQL 에서는 MINUS를 사용할수 없음
-- SELECT job
-- from emp
-- where DEPTNO=20;

-- SELECT job
-- from emp
-- where DEPTNO=10
-- and EXISTS(
-- SELECT job
-- from emp
-- where DEPTNO=20
-- AND 
-- e1.job = e2.job
-- );

SELECT DISTINCT e1.job
FROM emp e1
WHERE e1.deptno = 10
  AND NOT EXISTS (
      SELECT 1
      FROM emp e2
      WHERE e2.deptno = 20
        AND e2.job = e1.job
  );
/*
<EXISTS 다중행 연산자>
=> 다중행 연산자 : IN('='포함,or) , ANY(or 의미만,추가적인 비교연산자 필요), ALL(and 의미만,추가적인 비교연산자 필요), EXISTS
=> 형식 : where EXISTS(조건식)
          ==> 조건식의 결과행이 0개 이면 거짓
                               1개 이상이면 참 
=> 참고) where 컬럼명 in (value_list)                             

*/



#<MySQL에서 MINUS 구현>
SELECT DISTINCT e1.job
FROM emp e1
WHERE e1.deptno = 10
  AND NOT EXISTS (
      SELECT 1
      FROM emp e2
      WHERE e2.deptno = 20
        AND e2.job = e1.job
  );



# <INTERSECT 교집합> => 공통 데이터 집합
SELECT job
FROM emp e1
WHERE deptno = 10
  AND EXISTS (
      SELECT 1
      FROM emp e2
      WHERE e2.deptno = 20
        AND e2.job = e1.job
 );
