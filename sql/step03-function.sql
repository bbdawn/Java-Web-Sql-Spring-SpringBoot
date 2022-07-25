-- DDL 
/*
 		테이블명 : product
 		컬럼명 : id , name , maker, price 
 		데이터타입 : id와 price는 number , name과 maker는 varchar2(100)
 		제약조건 : id는 primary key, name과 maker는 not null, price는 default 0  
 */
CREATE TABLE product(
	id NUMBER PRIMARY KEY,
	name VARCHAR2(100) NOT NULL,
	maker VARCHAR2(100) NOT NULL,
	price NUMBER DEFAULT 0
)
-- DML  
INSERT INTO product(id,name,maker,price) VALUES(1,'불닭볶음면','삼양',1500);
INSERT INTO product(id,name,maker,price) VALUES(2,'진라면','오뚜기',1100);
INSERT INTO product(id,name,maker,price) VALUES(3,'테라','하이트진로',1800);
INSERT INTO product(id,name,maker,price) VALUES(4,'참이슬후레쉬','하이트진로',1300);

SELECT * FROM product;

commit

-- 데이터베이스 함수 테스트 
-- 수량  COUNT(*)
SELECT COUNT(*) FROM product;

-- 상품 최저가 
SELECT MIN(price) FROM product;
-- 상품 최고가
SELECT MAX(price) FROM product;
-- 상품 평균가
SELECT AVG(price) FROM product;

-- 정렬 : 오름차순 정렬 ASC , 내림차순 정렬 DESC 
-- price 기준으로 정렬 
-- 아래처럼 ORDER BY 만 명시하면 기본 옵션이 ASC 오름차순 
SELECT name,price FROM product ORDER BY price;
SELECT name,price FROM product ORDER BY price ASC;
SELECT name,price FROM product ORDER BY price DESC;

/*
 * 		SELECT 컬럼명
 * 		FROM 테이블명 
 * 		WHERE 조건절 AND 조건절 
 * 		ORDER BY 컬럼명 
 */
-- 		maker가 하이트진로인 상품의 id,name,price를 조회하되 price 내림차순으로 정렬한다 
SELECT id,name,price FROM product WHERE maker='하이트진로' ORDER BY price DESC;

SELECT * FROM product;

-- price가 1300 이상 1700 이하인 상품의 name과 price를 조회 ( price 오름차순 ) 
SELECT name,price FROM product WHERE price>=1300 AND price<=1700 ORDER BY price ASC;

-- 위의 SQL을 BETWEEN AND로도 표현할 수 있다 
SELECT name,price FROM product WHERE price BETWEEN 1300 AND 1700 ORDER BY price ASC;

-- PRIMARY KEY( id ) 로 검색해서 상품의 존재 유무 확인 -> PK ( UNIQUE + NOT NULL ) 
-- 존재하면 1 존재하지 않으면 0 
SELECT COUNT(*) FROM product WHERE id=2;
SELECT COUNT(*) FROM product WHERE id=5;

-- 컬럼 별칭 
SELECT MIN(price) AS 최저가 FROM product;

-- maker 조회하면 하이트진로가 두개 나온다 
SELECT maker FROM product;

-- DISTINCT : maker의 종류를 중복없이 조회 
SELECT DISTINCT maker FROM product;

SELECT * FROM product;

-- LIKE 연산자 : 데이터의 일부가 포함되는 정보를 검색하는 연산자 
-- WHERE 컬럼명 LIKE '%키워드%'
-- % : 0개 이상의 문자 
SELECT * FROM product WHERE name LIKE '%면%';
SELECT * FROM product WHERE name LIKE '%라%';
SELECT * FROM product WHERE maker LIKE '%트진%';

-- 위 SQL 들을 어플리케이션에서 적용 : 03-jdbc-product 에서 구현 









