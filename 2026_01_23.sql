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

-- 문제7) 사원들의 이름과 직책을 출력하시오.
--        (출력변경 ==> SMITH사원의 직책은 CLERK입니다.)
SELECT CONCAT(ename, '사원의 직책은 ', job, '입니다.') AS 출력결과
FROM emp;

-- 문제8) 사원들이 갖는 직책을 출력하시오.
--       (중복된 직책은 제거해서 출력)  : 직책의 종류
SELECT DISTINCT job 
FROM emp;

SELECT
  10 + 3 AS plus,
  10 - 3 AS minus,
  10 * 3 AS multiply,
  10 / 3 AS divide,
  10 % 3 AS remainder1,
  MOD(10, 3) AS remainder2,
  FLOOR(10 / 3) AS floor_divide;




-- WHERE절 --

-- 문제1) 20번 부서에 근무하는 사원의 사원번호, 사원명, 직책, 급여를 출력하시오.
SELECT empno AS 사원번호,
       ename AS 사원명,
       job   AS 직책,
       sal   AS 급여
FROM emp
WHERE deptno = 20;

--  

-- 문제2) 직책이 MANAGER인 사원의 사원번호, 사원명, 직책, 입사일을 출력하시오.
SELECT empno AS 사원번호,
       ename AS 사원명,
       job   AS 직책,
       hiredate AS 입사일
FROM emp
WHERE job = 'MANAGER';


-- 문제3) 급여가 2000 이상인 사원의 사원번호, 사원명, 급여를 출력하시오.
SELECT empno AS 사원번호,
       ename AS 사원명,
       sal   AS 급여
FROM emp
WHERE sal >= 2000;


-- 문제4) FORD사원의 사원번호, 사원명, 부서번호를 출력하시오.
SELECT empno AS 사원번호,
       ename AS 사원명,
       deptno AS 부서번호
FROM emp
WHERE ename = 'FORD';



-- 문제5) 1981년 6월 1일 이후에 입사한 사원의 사원번호, 사원명, 부서번호, 입사일을 출력하시오.
SELECT empno AS 사원번호,
       ename AS 사원명,
       deptno AS 부서번호,
       hiredate AS 입사일
FROM emp
WHERE hiredate > '1981-06-01';



-- 문제6) 10번 부서에 근무하는 사원의 사원번호, 사원명, 매니저의 사원번호를 출력하시오.
SELECT empno AS 사원번호,
       ename AS 사원명,
       mgr   AS 매니저사원번호
FROM emp
WHERE deptno = 10;


-- 문제7) 20번과 30번 부서에 근무하는 사원의 사원번호, 사원명, 매니저의 사원번호를 출력하시오. 
SELECT empno AS 사원번호,
       ename AS 사원명,
       mgr   AS 매니저사원번호
FROM emp
WHERE deptno IN (20, 30);


-- 문제8) 10,20번 부서의 부서번호, 부서명, 부서위치를 조회하시오.
SELECT deptno AS 부서번호,
       dname  AS 부서명,
       loc    AS 부서위치
FROM dept
WHERE deptno IN (10, 20);

-- 문제9) 3등급 급여의 최소급여와 최대급여를 출력하시오.
SELECT MIN(losal) AS 최소급여,
       MAX(hisal) AS 최대급여
FROM salgrade
WHERE grade = 3;




-- like 문
-- 문제1) 사원명이 'A'로 시작되는 사원의 정보(사원번호,사원명,급여)를 출력하시오
SELECT empno AS 사원번호,
       ename AS 사원명,
       sal   AS 급여
FROM emp
WHERE ename LIKE 'A%';

-- 문제2) 사원명이 'S'로 끝나는 사원의 정보(사원번호,사원명,급여)를 출력하시오
SELECT empno AS 사원번호,
       ename AS 사원명,
       sal   AS 급여
FROM emp
WHERE ename LIKE '%S';


-- 문제3) 사원명에 'A'문자가 포함된 사원의 정보(사원번호,사원명,급여)를 출력하시오   
SELECT empno AS 사원번호,
       ename AS 사원명,
       sal   AS 급여
FROM emp
WHERE ename LIKE '%A%';


-- 문제4) 사원명의 세번째 문자에 'A'문자가 포함된 사원의 정보(사원번호,사원명,급여)를 출력하시오
SELECT empno AS 사원번호,
       ename AS 사원명,
       sal   AS 급여
FROM emp
WHERE ename LIKE '__A%';


-- 문제5) 사원명에 '%'문자가 포함된 사원의 정보(사원번호,사원명,급여)를 출력하시오
INSERT INTO emp (empno, ename, sal)
VALUES (8000, '홍%길동', 2500);

INSERT INTO emp (empno, ename, sal)
VALUES (8001, '%김주원', 2600);

INSERT INTO emp (empno, ename, sal)
VALUES (8002, '나주원%', 2700);


SELECT empno AS 사원번호,
       ename AS 사원명,
       sal   AS 급여
FROM emp
WHERE ename LIKE '%#%%' ESCAPE '#';






