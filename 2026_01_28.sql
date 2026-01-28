

#사원의 정보(사원번호, 사원명, 부서번호, 부서명)를 출력하시오.

select empno, ename, deptno
from  emp;

# empno	ename	deptno
-- 7369	SMITH	20
-- 7499	ALLEN	30
-- 7521	WARD	30
-- 7566	JONES	20
-- 7654	MARTIN	30
-- 7698	BLAKE	30
-- 7782	CLARK	10
-- 7788	SCOTT	20
-- 7839	KING	10
-- 7844	TURNER	30
-- 7876	ADAMS	20
-- 7900	JAMES	30
-- 7902	FORD	20
-- 7934	MILLER	10

#사원의 정보(사원번호, 사원명, 부서번호, 부서명)를 출력하시오.
select empno, ename, deptno, dname
from  emp;
#Error Code: 1054. Unknown column 'dname' in 'field list'
#=> 부서명은 부서테이블(dept)에 존재

select empno, ename, deptno, dname
from  emp , dept;
#Error Code: 1052. Column 'deptno' in field list is ambiguous
#deptno컬럼은 두 테이블에 함께 존재하므로 특정테이블명.컬럼명으로 명시

select emp.empno, emp.ename, dept.deptno, dept.dname
from  emp , dept;
-- #결과: 56행 4열 
-- #문제점: 사원은 14명인데 56행의 결과를 얻어옴 (원하는 결과행은 14행)
select emp.empno, emp.ename, dept.deptno, dept.dname
from  emp  
inner join dept;


-- #문제 해결 => 공통(관련) 컬럼을 동등비교
select emp.empno, emp.ename, dept.deptno, dept.dname
from  emp  
inner join dept
on emp.deptno = dept.deptno;


-- select emp.empno, emp.ename, dept.deptno, dept.dname
-- from  emp  join dept
-- using (emp.deptno);    #on절을 생략  ==> on emp.deptno = dept.deptno 와 같은 의미를 갖음
-- 주의: using절을 사용할때는 컬럼명만 사용해야 함.   특정테이블명.컬럼명(X)
select emp.empno, emp.ename, dept.deptno, dept.dname
from  emp  
join dept
on emp.deptno = dept.deptno;


-- => on사용시와 동일한 결과
select emp.empno, emp.ename, dept.deptno, dept.dname
from  emp  join dept
using (deptno);    # on절을 생략  ==> on emp.deptno = dept.deptno 와 같은 의미를 갖음


-- #위의 on절 또는 using절을 사용할때와 동일한 결과를 얻을 수 있음
-- #정리) natural join은 간결해 보이지만  문제점이 있습니다.
-- #     두테이블간에 공통의 컬럼(컬럼명이 같다면, 자료형과 상관없이)이 있다면 무조건 매핑을 합니다.
select emp.empno, emp.ename, dept.deptno, dept.dname
from  emp  
natural join dept; 


-- 사원이 속하지 않은 40번 부서의 정보도 출력하고 싶다. 
-- 여기에서는 사원과 매핑되지 않는 40번 부서의 정보가 dept에 있으므로 dept테이블 위치의 좌우를 표시하면 끝 
SELECT EMPNO, ename, d.deptno, dname
from emp e 
RIGHT outer JOIN dept d
on e.DEPTNO = d.DEPTNO

-- NULL	NULL	40	OPERATIONS




 # 사원의 정보(사원번호, 사원명, 매니저의 사원번호, 매니저의 사원명)을 출력하시오 
SELECT
    e.empno   AS 사원번호,
    e.ename   AS 사원명,
    m.empno   AS 매니저번호,
    m.ename   AS 매니저명
FROM emp e
JOIN emp m
ON e.mgr = m.empno;

-- ============================== JOIN문제 ============================================
-- -- ※아래의 문제들을 ANSI JOIN으로 해결하시오.

-- -- 문제1) 사원들의 이름, 부서번호, 부서이름을 출력하시오.

SELECT e.ename, e.deptno, d.dname
FROM emp e
JOIN dept d
ON e.deptno = d.deptno;


-- -- 문제2) 부서번호가 30번인 사원들의 이름, 직급, 부서번호, 부서위치를 출력하시오.
SELECT e.ename, e.job, e.deptno, d.loc
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE e.deptno = 30;



-- -- 문제3) 커미션을 받는 사원의 이름, 커미션, 부서이름, 부서위치 출력하시오.(커미션 0은 제외)
SELECT e.ename, e.comm, d.dname, d.loc
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE e.comm IS NOT NULL
AND e.comm > 0;

-- -- 문제4) DALLAS에서 근무하는 사원들의 이름, 직급, 부서번호, 부서이름을 출력하시오.
SELECT e.ename, e.job, e.deptno, d.dname
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE d.loc = 'DALLAS';


-- -- 문제5) 사원이름에 'A'가 들어가는(포함하는) 사원들의 이름과 부서이름을 출력하시오.
SELECT e.ename, d.dname
FROM emp e
JOIN dept d
ON e.deptno = d.deptno
WHERE e.ename LIKE '%A%';


-- -- 문제6) 사원이름과 직급, 급여, 급여등급을 출력 하되 급여등급에 대한 오름 차순 정렬하시오.
SELECT e.ename, e.job, e.sal, s.grade
FROM emp e
JOIN salgrade s
ON e.sal BETWEEN s.losal AND s.hisal
ORDER BY s.grade ASC;


-- -- 문제7) 사원들의 이름과 그 사원과 같은 부서에 근무하는 사원의 사원명, 부서번호를 출력하시오.
-- --         ==> 자기 이름을 제외한 동료(56행) 정보 출력!!

SELECT e1.ename AS 사원명,
       e2.ename AS 동료명,
       e1.deptno
FROM emp e1
JOIN emp e2
ON e1.deptno = e2.deptno
AND e1.empno <> e2.empno;

-- -- 문제8) 전체사원의 사원번호, 사원명, 부서번호, 부서명을 출력하시오 
-- --         ==> (사원이 속하지 않은 부서의 정보도 함께 출력)
SELECT e.empno, e.ename, d.deptno, d.dname
FROM dept d
LEFT JOIN emp e
ON d.deptno = e.deptno;


-- -- 문제9) 전체 사원의 사원번호, 사원명, 직속상사명을 출력하시오
--         ==> (14명 사원 전부!!)


SELECT e.empno,
       e.ename,
       m.ename AS manager_name
FROM emp e
LEFT JOIN emp m
ON e.mgr = m.empno;









