


CREATE TABLE member (
    id INT,
    name VARCHAR(20),
    age INT
);

ALTER TABLE member
ADD phone VARCHAR(20);


ALTER TABLE member
DROP phone;

INSERT INTO member (id, name, age)
VALUES (1, '홍길동', 20);


INSERT INTO member (id, name, age)
VALUES 
(2, '김영희', 25),
(3, '이철수', 30);

DELETE FROM member;




use sisadb;

SHOW TABLES;

CREATE TABLE my (
   no int
);

select * from my;

DROP TABLES if EXISTS my;


CREATE TABLE my (
   no int,
   NAME VARCHAR(10)
);


desc my;


-- 문제 1 ) 테이블 my의 이름(식별자)을 my_tbl 로 변경하자.


-- RENAME 문법 형식(객체 이름변경)  ==> DDL

RENAME TABLE my TO my_tbl;

desc my_tbl;

select * from my_tbl;


-- 문제) my_tbl 테이블에 아래 데이터를 추가하시오 
--      그리고 추가된 데이터를 확인하고
--      그 다음에 전체 데이틀 삭제하시오 

-- INSERT문법 사용법

-- INSERT INTO 테이블명 [(컬럼명1),(컬럼명2)] VALUES (데이터1,데이터2);


INSERT INTO my_tbl (no,NAME) VALUES (1,'홍길동');
INSERT INTO my_tbl (no,NAME) VALUES (2,'나길동');
INSERT INTO my_tbl (no,NAME) VALUES (3,'김주원');
INSERT INTO my_tbl (no,NAME) VALUES (4,'차라임');

select * from my_tbl;

/*
<TRUNCATE 문법형식>
TRUNCATE TABLE 테이블명;
==> 테이블내의 전체 데이터를 삭제,
*/


TRUNCATE TABLE my_tbl;
-- 전체 데이터 확인 

select count(*) from my_tbl;

/*
 DELETE 로 삭제 
 ※ DELETE 문법
   DELETE from 테이블명
 	     [where 조건식];
 ==> delete 와 update 시에는 반드시 한번더 생각!!!
 ==> 전체에 대해서 수정 삭제를 할지 아니면 일부에 대한 수정,삭제를 할지 생각할것! 
 ==> 일부 삭제시(where을 사용)
 
	<truncate와 delete의 차이>
	
	- truncate : 무조건 전체 삭제, rollback 불가, 빠름
	                              =============
								  ★DDL 은 auto commit을 갖음!
								   
	- delete   : 선택적 삭제 가능, rollback 가능, 느림
		                          =============
	
	==> rollback이란 전체작업(DML명령어) 취소를 의미
	
	==> commit이란 전체작업(DML명령어)에 대한 물리적인 반영.
	
	==> 일반적으로 date 삭제시 delete를 사용.
*/


INSERT INTO my_tbl (no,NAME) VALUES (1,'홍길동');
INSERT INTO my_tbl (no,NAME) VALUES (2,'나길동');
INSERT INTO my_tbl (no,NAME) VALUES (3,'김주원');
INSERT INTO my_tbl (no,NAME) VALUES (4,'차라임');

select count(*) from my_tbl;

DELETE FROM my_tbl;
-- ==> where 절을 사용하지 않은것은 전체행을 삭제하겠다는 뜻!

-- ==========================================================================

SELECT @@autocommit;

INSERT INTO my_tbl (no,NAME) VALUES (1,'홍길동');
INSERT INTO my_tbl (no,NAME) VALUES (2,'나길동');
INSERT INTO my_tbl (no,NAME) VALUES (3,'김주원');
INSERT INTO my_tbl (no,NAME) VALUES (4,'차라임');

COMMIT;

select COUNT(*) FROM my_tbl;

DELETE FROM my_tbl; 
-- where와 함께 사용 => 전체 행 삭제

select COUNT(*) FROM my_tbl;

ROLLBACK; 
-- 1.트랜젝션내의 모든 DML작업에 대한 취소 2. 새로운 트랜잭션 시작

select COUNT(*) FROM my_tbl;

SELECT * FROM my_tbl;

DELETE FROM my_tbl
WHERE name like '%길동';

SELECT * FROM my_tbl;
