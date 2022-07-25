-- DDL : CREATE 테이블 생성 
CREATE TABLE typetest(
	name VARCHAR2(9) PRIMARY KEY,
	money NUMBER NOT NULL
)
-- DML : INSERT 
-- ERROR : NAME의 최대 사이즈가 9 , 아래는 10자이므로 ERROR 
INSERT INTO typetest(name,money) VALUES('ABCDEFGHIJ',100);
-- 9자이므로 succeeded
INSERT INTO typetest(name,money) VALUES('ABCDEFGHI',100);
-- succeeded
INSERT INTO typetest(name,money) VALUES('아이유',100);
-- 한글은 한자당 3byte를 차지하므로 3자까지 가능 ERROR 
INSERT INTO typetest(name,money) VALUES('박보검님',100);

-- DML : UPDATE 구문으로 아이유의 money에 200을 누적시킨다 
UPDATE typetest SET money=money+200 WHERE name='아이유';
-- DML : SELECT 구문으로 NAME이 아이유인 대상의 MONEY를 조회 
SELECT money FROM typetest WHERE name='아이유';

-- DDL : DROP 을 이용한 테이블 삭제 
DROP TABLE typetest;

SELECT * FROM typetest;

-- DDL : ALTER 를 이용한 테이블 정보 변경 ( TABLE 명 변경 , COLUMN 명 변경 , 제약조건 및 타입변경 ) 
CREATE TABLE alter_test(
	id VARCHAR2(100) PRIMARY KEY,
	hit NUMBER DEFAULT 0
)
-- 제약조건 DEFAULT : 별도로 INSERT 하지 않으면 초기값이 0으로 저장 
INSERT INTO alter_test(id) VALUES('java');
-- hit 가 0 으로 저장되어 있음을 확인 
SELECT * FROM alter_test;

-- DDL : ALTER를 이용해 테이블명을 변경해본다 
ALTER TABLE alter_test RENAME TO alter_test2;

SELECT * FROM alter_test2;

-- DDL : ALTER를 이용해 컬럼명을 HIT에서 COUNT로 변경해본다 
ALTER TABLE alter_test2 RENAME COLUMN hit TO count;








