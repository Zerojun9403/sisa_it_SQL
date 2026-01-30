############### DDL미션 #################

/*
문제1) 아래와 같이 테이블을 생성해 보자.
<기본 테이블>
테이블명 : member (멤버테이블)
컬럼명 : id (식별번호)
            name (이름)
            age (나이)
테이블을 생성해 보자.
*/

# 만약 member라는 테이블이 이미 존재한다면 CREATE TABLE member 당연히 에러가 발생!!
# 그래서 member 테이블 전 drop table 를 실행하는것이 좋고 if exist 를 포함해서 실행하면 더더욱 좋다.
# 주의) 기존에 존재하는 member 테이블을 지워도 전혀 상관이 없을때 라는 가정!


drop table if exists member;

CREATE TABLE `member` (
    `id` INT,
    `name` VARCHAR(20),
    `age` INT
);

# 인용부호 : ' ', " ", ` `
# => 사용1 : '' 작은따옴표 : 문자(문자열) 데이터를 표시할때  사용
#           select ename , 'ename'=문자열 

#    사용2 : " " 큰 따옴표 : 주로 alias(별칭) 표시할때 사용
#           select ename "사원명" , 'ename' AS "출력문자"  

#    사용3 :` ` back-tick : mysql에서 식별자를 정의할때 사용함. 
#          => 만약 식별자명(테이블명, 컬럼명)에 예약어도 구분하여 사용할 수 있다. 

/*
문제2)  
- member테이블에 폰정보 컬럼(phone varchar(20))를 추가해 보자.
- 추가된 phone의 길이를 30으로 증가해 보자.
- 추가된 phone컬럼을 삭제해 보자
*/
ALTER TABLE `member` ADD `phone` VARCHAR(20);
DESC MEMBER;
# drop table을 하면 테이블도 삭제되고 당연히 그안에 있는 데이터도 함계 손실. 
# 만약, 10만건의 중요한 데이터가 있자고 가정했을때 모두 삭제  ==> 그 뿐 아니라 alter명령어는 DDL 이므로 rollback이 불가능
# 데이터 손실없이 (table) 객체 구조만 변경하고 싶다면 alter!! ==> 데이터가 그대로 유지!! 


ALTER TABLE `member` MODIFY `phone` VARCHAR(30);
ALTER TABLE member DROP phone;





# 문제3) member테이블에 데이터를 추가해 보자. (3개 행 정도)
# INSERT INTO 테이블명  [(컬럼명1, 컬럼명2)]  VALUES  (데이터1, 데이터2) ;
# INSERT INTO 테이블명  [(컬럼명1, 컬럼명2)]  VALUES  (데이터1, 데이터2),(데이터1, 데이터2) ;

insert into member  (id,name,age) values (1, '홍길동', 13);
insert into member  (id,name,age) values (2, '나길동', 14);
insert into member  (id,name,age) values (3, '너길동', 15);

insert into member  (id,name,age) values (1, '홍길동', 13),
                                         (2, '나길동', 14),
                                         (3, '너길동', 15);

select * from member;


# 문제4) member테이블의 전체 데이터를 삭제해보자
# DELETE FROM 테이블명 [ WHERE  조건식  ];

delete from member;
# 에러: MySQL Workbench에서는 데이터 보호를 위해 where절을 사용하고 그안에 비교대상을 primary key로 했을 실행을 가능하게 합니다.
# 실행을 위하여 Edit메뉴 - Preferences... 선택
#      => 좌측 SQL Editor 선택 
#      => 우측 하단 Safe Updates (rejects UPDATEs and DELETEs with no restrictions) => 체크박스 해제
#      => 그리고 MySQL Workbench를 재시작하면 삭제가 잘 됩니다.

