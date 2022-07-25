-- 한줄 주석 
/*  
  여러줄 주석 , SQL 은 대소문자 구별하지 않는다  
 
  SQL ( Structured Query Language ) : 데이터베이스에서 데이터를 정의,조작,제어하는 언어 
  
  1. DDL ( Data Definition Language : 데이터 정의어 ) - CREATE 생성 , DROP 삭제 , ALTER 수정 
  2. DML ( Data Manipulation Language : 데이터 조작어 ) - INSERT 삽입 , SELECT 조회, UPDATE 수정, DELETE 삭제 
  3. DCL ( Data Control Language : 데이터 제어어 ) - GRANT 권한부여 , REVOKE 권한취소 , 
  4. TCL ( Transaction Control Language ) -  COMMIT 실제 DB에 반영 , ROLLBACK 작업을 취소하고 원상태로 되돌린다 
  														  
  TABLE - 데이터를 저장하는 공간 
  COLUMN - 속성 ( attribute ) 
  DATA TYPE - 문자열 ( VARCHAR2 ) , 숫자형 ( NUMBER ) 등 
  CONSTRAINT - 제약조건   ex -  PRIMARY KEY 제약조건 : NOT NULL + UNIQUE ( 반드시 존재해야 하고 유일해야 한다 ) 
  										NOT NULL 제약조건 : NULL을 허용하지 않는다 ( 반드시 데이터가 존재해야 함 ) 														  
 */
 -- SQL 실행 단축키 : 영역 지정 후 ALT + X 

-- DDL : CREATE 를 이용한 회원 테이블 생성 
CREATE TABLE member(
	id VARCHAR2(100) PRIMARY KEY,
	password VARCHAR2(100) NOT NULL,
	name VARCHAR2(100) NOT NULL,
	address VARCHAR2(100)
)

CREATE TABLE spring_member(
	id VARCHAR2(100) PRIMARY KEY,
	password VARCHAR2(100) NOT NULL,
	name VARCHAR2(100) NOT NULL,
	address VARCHAR2(100)
)
INSERT INTO spring_member VALUES('java','a','아이유','오리');
commit

-- DDL : DROP을 이용한 회원 테이블 삭제 
DROP TABLE member;

-- DML : SELECT 데이터 조회 
SELECT * FROM member;
-- DML : INSERT 데이터 삽입 
INSERT INTO member(id,password,name,address) VALUES('java','abcd','아이유','오리');
INSERT INTO member(id,password,name,address) VALUES('spring','dcba','박보검','죽전');

-- PRIMARY KEY 제약조건 테스트 : id는 primary key로 제약조건이 명시되어 있고 not null + unique 이어야 하므로 error , java id는 기존에 존재 
INSERT INTO member(id,password,name,address) VALUES('java','a','b','c');
-- PRIMARY KEY 제약조건 테스트 : id는 primary key로 제약조건이 명시되어 있고 not null + unique 이어야 하므로 error , id는 null을 입력할수없음 
INSERT INTO member(password,name,address) VALUES('a','b','c');
-- NOT NULL 제약조건 테스트 : password는 not null 제약조건이 명시되어 있으므로 반드시 데이터를 입력해야 한다 
INSERT INTO member(id,name,address) VALUES('jsp','b','c');
-- 아래 sql 은 succeeded , address는 별도의 제약조건이 없으므로 null 이 허용 
INSERT INTO member(id,password,name) VALUES('jsp','b','강하늘');

SELECT id,address FROM MEMBER;

-- WHERE 조건절을 이용한 조회 
SELECT * FROM member WHERE id='java';

-- DML : Update 수정 ( id가 jsp인 회원의 address를 null에서 강남으로 수정 ) 
UPDATE member SET address='강남' WHERE id='jsp'; 

SELECT * FROM member WHERE id='jsp';

-- DML : DELETE 삭제 ( id가 jsp인 회원을 삭제 ) 
DELETE FROM member WHERE id='jsp';

SELECT * FROM member;

-- 2일차 
-- 회원 아이디 angel  패스워드 kind  이름 이상순  주소 애월읍 -> insert 구문 
INSERT INTO member(id,password,name,address) VALUES('angel','kind','이상순','애월읍');

SELECT * FROM MEMBER;

-- 조건절 ( WHERE ~ AND  ) : NAME이 이상순이고 ADDRESS가 애월읍인 MEMBER의 ID와 PASSWORD를 조회
SELECT id,password FROM member WHERE name='이상순' AND address='애월읍';

-- 회원의 address 가 애월읍인 회원의 address를 오리로 업데이트 
UPDATE member SET address='오리' WHERE address='애월읍';

-- 회원 id가 angel 인 회원 정보를 삭제 
DELETE FROM member WHERE id='angel';








