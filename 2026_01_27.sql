-- SQL 내 내장함수 
# -------------------  숫자 함수  -------------------
--  -5, 0, 5 의 절대값을 출력하시오.
SELECT 
  ABS(-5) AS abs1,
  ABS(0)  AS abs2,
  ABS(5)  AS abs3;


--  12.2와  -12.2에 대해 무조건 올림 하시오.
SELECT
  CEILING(12.2)  AS ceil1,
  CEILING(-12.2) AS ceil2;


-- 12.6과  -12.2에 대해 무조건 내림 하시오.
SELECT
  FLOOR(12.6)  AS floor1,
  FLOOR(-12.2) AS floor2;


-- 1526.159 에 대하여 반올림 하시오.
SELECT ROUND(1526.159, 0) AS rounded;


-- 1526.159 에 대하여 버림 하시오.
SELECT FLOOR(1526.159) AS truncated;


-- 2의 3승을 구하시오.
SELECT POWER(2, 3) AS result;


-- 8을 3으로 나눈 몫을 구하시오.
SELECT 8 / 3 AS quotient;


-- 4, 3, 7, 5, 9 에서 가장 큰 수를 구하시오.
SELECT MAX(num) AS max_value
FROM (
    SELECT 4 AS num
    UNION ALL SELECT 3
    UNION ALL SELECT 7
    UNION ALL SELECT 5
    UNION ALL SELECT 9
) t;

# ------------------- 문자 관련 함수 ----------------------
-- '0' , 'A' , 'a' 에 대한 아스키 코드 값을 구하시오.
SELECT
  ASCII('0') AS ascii_0,
  ASCII('A') AS ascii_A,
  ASCII('a') AS ascii_a;


-- '7788번 사원의 이름 SCOTT' 를 한 문장으로 붙여서 출력하시오.
SELECT CONCAT('7788번 사원의 이름 ', ename) AS result
FROM emp
WHERE empno = 7788;


-- insert()함수를 사용하여 'helloabc!!!'의 abc를  'hello sisait!!!'로 변경하시오.
select insert('helloabc!!!', 6, 3, ' sisait')
from dual;




# ------------------- 문자 관련 함수 ----------------------
-- replace()함수를 사용하여 'helloabc!!!'의 abc를  'hello sisait!!!'로 변경하시오
SELECT REPLACE('helloabc!!!', 'abc', 'sisait') AS result;

-- 'hello sisait!!!'에서 'sisait'의 시작위치를 출력하시오.
SELECT LOCATE('sisait', 'hello sisait!!!') AS position;

-- 'hello sisait!!!'문자열에서 특정 부분문자열('sisait')을 가져오시오.
SELECT SUBSTRING('hello sisait!!!', 7, 6) AS substring_result;

-- '!!!tiasis olleh'를 역순으로 출력하시오.
SELECT REVERSE('!!!tiasis olleh') AS reversed;

-- 'hELlo SisaIt!!!'를 전체 소문자로 출력하시오.
SELECT LOWER('hELlo SisaIt!!!') AS lower_result;

-- 'hELlo SisaIt!!!'를 전체 대문자로 출력하시오.
SELECT UPPER('hELlo SisaIt!!!') AS upper_result;

-- 'hELlo SisaIt!!!'기준 왼쪽에서 5개의 문자, 오른쪽에서 6개의 문자를 가져오시오.
SELECT 
  LEFT('hELlo SisaIt!!!', 5)  AS left_part,
  RIGHT('hELlo SisaIt!!!', 6) AS right_part;
  
# ------------------- 날짜 관련 함수 ----------------------
-- 오늘날짜를 '2026-01-26 14:31:39' 형태로 출력하시오.
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s') AS now_datetime;

-- 오늘날짜를 '2026-01-26' 형태와 '14:31:39'형태로 출력하시오.
SELECT 
  DATE_FORMAT(NOW(), '%Y-%m-%d') AS today,
  DATE_FORMAT(NOW(), '%H:%i:%s') AS now_time;

-- 현재 날짜를 출력하고 그 날짜의 5초후, 5시간후,5일후를 출력하시오.
SELECT
  NOW() AS now_time,
  DATE_ADD(NOW(), INTERVAL 5 SECOND) AS after_5_sec,
  DATE_ADD(NOW(), INTERVAL 5 HOUR)   AS after_5_hour,
  DATE_ADD(NOW(), INTERVAL 5 DAY)    AS after_5_day;

-- 현재 날짜에 대하여  년도, 월, 월의 영문, 요일 영문, 일자, 주별 일자, 몇주를 출력하시오.
SELECT
  YEAR(NOW())                         AS year,
  MONTH(NOW())                        AS month,
  MONTHNAME(NOW())                    AS month_name,
  DAYNAME(NOW())                      AS day_name,
  DAY(NOW())                          AS day,
  DAYOFWEEK(NOW())                    AS day_of_week,
  WEEK(NOW())                         AS week_number;


-- 2024-07-12 06:59:05	2024 July 12 AM 6 59 05	24-07-12 06:59:05	24.07.12 Friday	06시59분05초
SELECT
  DATE_FORMAT('2024-07-12 06:59:05', '%Y %M %d %p %h %i %s') AS format1,
  DATE_FORMAT('2024-07-12 06:59:05', '%y-%m-%d %H:%i:%s')   AS format2,
  DATE_FORMAT('2024-07-12 06:59:05', '%y.%m.%d %W')         AS format3,
  DATE_FORMAT('2024-07-12 06:59:05', '%H시%i분%s초')        AS format4;

-- 현재 날짜를 아래와 같은 형식으로 출력하시오.
-- 2026-01-27 09:16:18	
-- 2026 January 27 AM 9 16 18	
-- 26-01-27 09:16:18	
-- 26.01.27 Tuesday	
-- 09시16분18초
SELECT
  DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s')        AS f1,
  DATE_FORMAT(NOW(), '%Y %M %d %p %h %i %s')     AS f2,
  DATE_FORMAT(NOW(), '%y-%m-%d %H:%i:%s')        AS f3,
  DATE_FORMAT(NOW(), '%y.%m.%d %W')              AS f4,
  DATE_FORMAT(NOW(), '%H시%i분%s초')             AS f5;
# ------------------- 논리 관련 함수 ----------------------
-- 크다  작다  3  b  a
SELECT
  GREATEST('3', 'b', 'a') AS biggest,
  LEAST('3', 'b', 'a')    AS smallest;

# ------------------- 집계 함수 ----------------------

-- 사원의 총수, 급여의 합, 급여의 평균, 최고급여, 최저급여를 구하시오
SELECT
  COUNT(*)     AS emp_count,
  SUM(sal)     AS total_sal,
  AVG(sal)     AS avg_sal,
  MAX(sal)     AS max_sal,
  MIN(sal)     AS min_sal
FROM emp;
