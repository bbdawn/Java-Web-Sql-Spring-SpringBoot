/*
		Date 타입 : 데이터베이스 시간 ( 연,월,일 시,분,초 ) 를 관리하는 데이터 타입 
		
		주요 함수
		1. to_char() : 데이터베이스에 저장된 date 형의 정보를 문자열로 반환받을 때 사용하는 함수 
		2. to_date() : 문자 타입의 시간 정보를 데이터베이스의 date 형으로 변환해 저장할 때 사용하는 함수 
		
		sysdate 예약어 : 현재 시간을 표현하는 키워드 
*/
-- Oracle dual 테이블 : 오라클에서 제공하는 기본 테이블 , 함수와 예약어를 실행할 때 사용 

SELECT SYSDATE FROM DUAL;

-- TO_CHAR() 함수를 이용해 원하는 시간 포맷으로 설정해 문자열로 반환받는다 
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY.MM.DD') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'MM') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'DD') FROM DUAL;

SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH:MI:SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') FROM DUAL;
-- DAY 는 요일 
SELECT TO_CHAR(SYSDATE,'DAY') FROM DUAL;

-- 테이블 생성해서 테스트 
CREATE TABLE date_test(
	id VARCHAR2(100) PRIMARY KEY,
	mydate DATE NOT NULL
)

INSERT INTO date_test(id,mydate) VALUES('java',SYSDATE);

SELECT * FROM date_test;
-- 연 월 일 조회 
SELECT id,TO_CHAR(mydate,'YYYY.MM.DD') FROM date_test;

-- 웹어플리케이션에서 input type date 를 통해 연 월 일 정보를 받아와 db에 insert 
-- 연 월 일 정보는 문자열이므로 date 형으로 변환해 저장하기 위해 TO_DATE() 함수를 이용 

INSERT INTO date_test(id,mydate) VALUES('JSP',TO_DATE('2022.1.11','YYYY.MM.DD'));
INSERT INTO date_test(id,mydate) VALUES('MVC',TO_DATE('2021.4.5','YYYY.MM.DD'));

INSERT INTO date_test(id,mydate) VALUES('FRONT',TO_DATE('2000.4.5','YYYY.MM.DD'));

-- DATE 연산 : -1 을 하면 하루전 
SELECT id,mydate,mydate-1 FROM date_test;

-- 현재 기준으로 몇일 경과했는지 조회 
SELECT id,mydate,sysdate-mydate FROM date_test;
-- 소수점 이하 제외 trunc()
SELECT id,mydate,trunc(sysdate-mydate) FROM date_test;

-- 몇개월 경과 months_between(현재시간,등록시간)
SELECT id,mydate,trunc(months_between(sysdate,mydate)) FROM date_test;
-- 몇년 경과 
SELECT id,mydate,trunc(months_between(sysdate,mydate)/12) FROM date_test;










