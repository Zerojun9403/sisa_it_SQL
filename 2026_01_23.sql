

SELECT grade, losal, hisal
FROM salgrade;


SELECT dname, loc
FROM dept;

SELECT EMPNO, ENAME, HIREDATE, SAL
FROM emp;

SELECT '안녕, SQL~!!'
FROM emp;
-- ==> 14번 출력
/* 왜? 사원의 수가 14명 이기 때문에 */

SELECT '안녕, SQL~!!'
FROM dept;
-- ==> 4번 출력
-- => 1줄에 문자열을 출력하고 싶다. 1개의 행을 갖는 테이블이 필요!!

SELECT '안녕, SQL~!!'
FROM dual;
-- => dual : 가상테이블(더미테이블), 한행이 입력되어 있고 특정한 테이블의 추가 


SELECT empno AS 사원번호,
       ename AS 사원명
FROM emp;


-- 문제6) 각 사원들의 사원번호, 사원명, 급여, 연봉을 출력하시오. (연봉 계산은 *12)
SELECT empno AS 사원번호,
       ename AS 사원명,
       sal   AS 급여,
       sal * 12 AS 연봉
FROM emp;

-- 문제7) 사원들의 이름과 직책을 출력하시오.
--        (출력변경 ==> SMITH사원의 직책은 CLERK입니다.)
SELECT CONCAT(ename, '사원의 직책은 ', job, '입니다.') AS "사원직책"
FROM emp;
# 행과 열을 맞추어 grid하게 출력
# ==> 부드럽게 출력할수는 없을까?  해결) concat() 함수


-- 문제8) 사원들이 갖는 직책을 출력하시오.
--       (중복된 직책은 제거해서 출력)  : 직책의 종류
SELECT job AS 직책
FROM emp;  -- ==> 14명의 사원의 직책을 출력

SELECT DISTINCT job AS 직책
FROM emp;  -- ==> DISTINCT 함수 사용시 중복데이터가 사라진다. 


-- 문제9) 10과 3의 사칙연산의 결과를 출력하는 SQL문을 작성하시오. 
-- # 나누기를 신경쓰자
SELECT
  10 + 3 AS plus,
  10 - 3 AS minus,
  10 * 3 AS multiply,
  10 / 3 AS divide,
  10 % 3 AS remainder1,
  MOD(10, 3) AS remainder2,
  FLOOR(10 / 3) AS floor_divide;
