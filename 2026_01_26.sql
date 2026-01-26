-- IN 연산자
SELECT empno, ename, deptno, comm
FROM emp
WHERE comm IN (300, 500, 1400);



-- BETWEEN AND 연산자
SELECT empno, ename, sal
FROM emp
WHERE sal BETWEEN 1600 AND 3000;

-- 문제１) 커미션을 받는 사원의 사원번호, 사원명, 부서번호, 커미션을 출력하시오.

SELECT empno, ename, deptno, comm
FROM emp
WHERE comm IS NOT NULL;


-- 문제２) 커미션을 받을 조건이 되는 사원의 사원번호, 사원명, 부서번호, 커미션을 출력하시오.
SELECT empno, ename, deptno, comm
FROM emp
WHERE comm IS NOT NULL;

-- 문제３) 커미션을 받지 않는 사원의 사원번호, 사원명, 부서번호, 커미션을 출력하시오.
SELECT empno, ename, deptno, comm
FROM emp
WHERE comm IS NULL;


-- 문제４) 커미션을 받지 않는(커미션이 null인, 커미션을 받지않은 조건) 
--         사원의 사원번호, 사원명, 부서번호, 커미션을 출력하시오.

--    
-- ★★   데이터 값이 null인 것을 체크(비교)     :  컬럼명  IS NULL
--             null이 아닌것을 체크(비교)  :  컬럼명  IS NOT NULL

SELECT empno, ename, deptno, comm
FROM emp
WHERE comm IS NULL;

-- 문제５) 커미션을 받을 조건이 되는 
--           사원의 사원번호, 사원명, 부서번호, 커미션을 출력하시오.
SELECT empno, ename, deptno, comm
FROM emp
WHERE comm IS NOT NULL;
 
-- null date 
-- 문제1) 전체사원의 사원번호, 사원명, 급여, 연봉(comm포함)을 출력하시오.
--      ==> 연봉 : sal+comm
SELECT
    empno,
    ename,
    sal,
    sal + IFNULL(comm, 0) AS annual_sal
FROM emp;



-- 문제2) 사원들의 사원번호, 사원명, 커미션을 출력하되
--    커미션을 받지않는(커미션의 값이 null) 사원들은 0으로 출력하시오.
SELECT
    empno,
    ename,
    IFNULL(comm, 0) AS comm
FROM emp;



-- 문제3) 사원들의 사원번호, 사원명, 커미션을 출력하되
--    커미션을 받지않는(커미션의 값이 null) 사원들은 '없음'으로 출력하시오.
SELECT
    empno,
    ename,
    IFNULL(comm, '없음') AS comm
FROM emp;



-- 문제4) 10번 부서에 근무하는 사원들의 사원번호, 사원명, 직책, 매니저(상사)를 출력하시오.
--      (단, 매니저가 없는 경우 'CEO'를 출력하시오.)
SELECT
    e.empno,
    e.ename,
    e.job,
    IFNULL(m.ename, 'CEO') AS manager
FROM emp e
LEFT JOIN emp m
    ON e.mgr = m.empno
WHERE e.deptno = 10;


-- ORDER BY절

-- 문제1) 30번 부서에 근무하는 사원의 사원번호, 사원명, 급여를 출력하되
--          사원번호에 대해 내림차순으로 정렬하시오.
SELECT empno, ename, sal
FROM emp
WHERE deptno = 30
ORDER BY empno DESC;


-- 문제2) 30번 부서에 근무하는 사원의 사원번호, 사원명, 급여를 출력하되
--          사원명에 대해 오름차순으로 정렬하시오.
SELECT empno, ename, sal
FROM emp
WHERE deptno = 30
ORDER BY ename ASC;



-- 문제3) 30번 부서에 근무하는 사원의 사원번호, 사원명, 급여를 출력하되
--          급여를 많이 받는 순으로 출력하시오.
SELECT empno, ename, sal
FROM emp
WHERE deptno = 30
ORDER BY sal DESC;


-- 문제4) 가장 최근에 입사한 사원부터 사원번호, 사원명, 급여, 입사일을 출력하시오.        
SELECT empno, ename, sal, hiredate
FROM emp
ORDER BY hiredate DESC;
