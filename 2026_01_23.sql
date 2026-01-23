-- 문제1) 급여등급, 최소급여, 최대급여를 검색(조회)하시오.
SELECT grade, losal, hisal
FROM salgrade;

-- 문제2) 부서명과 부서위치를 출력하시오.
SELECT dname, loc
FROM dept;

-- 문제3) 사원번호, 사원명, 입사일, 급여를 조회(출력)하시오.
SELECT EMPNO, ENAME, HIREDATE, SAL
FROM emp;

-- 문제4) "안녕, SQL~!!"을 화면에 출력하시오.
SELECT '안녕, SQL~!!'
FROM dual;


-- 문제5) 화면에 사원번호와 사원명을 출력하시오.
SELECT empno AS 사원번호,
       ename AS 사원명
FROM emp;


-- 문제6) 각 사원들의 사원번호, 사원명, 급여, 연봉을 출력하시오. (연봉 계산은 *12)
SELECT empno AS 사원번호,
       ename AS 사원명,
       sal   AS 급여,
       sal * 12 AS 연봉
FROM emp;
# 행과 열을 맞추어 grid하게 출력
# ==> 부드럽게 출력할수는 없을까?  해결) concat() 함수


-- 문제7) 사원들의 이름과 직책을 출력하시오.
--        (출력변경 ==> SMITH사원의 직책은 CLERK입니다.)
SELECT CONCAT(ename, '사원의 직책은 ', job, '입니다.') AS 출력결과
FROM emp;

-- 문제8) 사원들이 갖는 직책을 출력하시오.
--       (중복된 직책은 제거해서 출력)  : 직책의 종류
SELECT DISTINCT job AS 직책
FROM emp;







