/* 

오라클 시퀀스(sequence)

: 순차적으로 증가, 유일한 값을 생성하기 위한 객체 
주로 primary key ( unique + not null ) 를 생성하기 위해 사용
테이블과는 독립적 구조 

CREATE SEQUENCE 시퀀스명 
[START WITH 시작번호]
[INCREMENT BY 증가값]
[MAXVALUE 최대값] 
[MINVALUE 최소값]
[ CYCLE or NOCYCLE ] 
[ NOCACHE ] 

​

Oracle dual table 
: 오라클에서 제공하는 기본 테이블 
컬럼 하나만 존재 , 주로 시퀀스 또는 날짜함수, 산술연산에 사용
sys Admin 계정에서 관리하고 수정 및 삭제 등 조작은 불가 
*/
SELECT * FROM dual;
-- 연산시 dual 을 사용 
SELECT 2*5 FROM dual;
-- 현재시간 SYSDATE
SELECT SYSDATE FROM dual;

-- 시퀀스 생성 
CREATE SEQUENCE test_seq;

-- DUAL TABLE을 이용해서 시퀀스 값을 확인 : nextval -> 시퀀스 다음값을 생성 
SELECT test_seq.nextval FROM dual;

-- 시퀀스 삭제 
DROP SEQUENCE test_seq;

-- test_seq 시퀀스를 다시 생성 ( 옵션 START WITH 시작번호 ) 
CREATE SEQUENCE test_seq START WITH 7;

-- TABLE에서 시퀀스를 활용 
CREATE TABLE car(
	car_no NUMBER PRIMARY KEY,
	model VARCHAR2(100) NOT NULL
)


-- 시퀀스 생성 
CREATE SEQUENCE car_seq;

INSERT INTO car(car_no,model) VALUES(car_seq.nextval,'소나타');

INSERT INTO car(car_no,model) VALUES(car_seq.nextval,'SM6');

SELECT * FROM car;











