-- SubQuery : 서브쿼리 , 부쿼리 , 하위쿼리 , SQL 내의 SQL 

SELECT * FROM product;
-- 상품 정보 중 최고가 2000
SELECT MAX(price) FROM product;
-- 2000 price 인 상품명을 조회 
SELECT name FROM product WHERE price=2000;

-- 가장 비싼 상품의 상품명name은? subquery를 이용하면 된다 
SELECT name FROM product WHERE price=(SELECT MAX(price) FROM product);

-- 전체 상품 중 상품의 평균가보다 높은 상품들 중 가장 낮은 가격의 상품 name,maker,price를 조회 
-- 1) 상품 평균가 -> 반올림 1467
	SELECT ROUND(AVG(price)) FROM product;
-- 2) 상품 평균가 1467 보다 높은 가격의 상품들 
    SELECT name,maker,price FROM product WHERE price>1467 ORDER BY price DESC;	
-- 3) 상품 평균가보다 높은 가격의 상품들 중 가장 낮은 가격은? 
	SELECT MIN(price) FROM product WHERE price>1467;
  
	-- subquery 를 이용해 위 1) 3) 을 하나의 sql로 처리해서 상품 평균가보다 높은 상품들 중 최저가를 구한다  
     SELECT MIN(price) FROM product WHERE price>(SELECT ROUND(AVG(price)) FROM product);
     
  -- 위 sql을 subquery로 처리해서 상품 평균가보다 높은 상품들 중 최저가의 상품의 name,maker,price를 조회   
  	SELECT name,maker,price
  	FROM	product
  	WHERE price=(
  		SELECT MIN(price) FROM product WHERE price>(SELECT ROUND(AVG(price)) FROM product)
  	)

  	-- 사원 테이블 
  	CREATE TABLE s_employee(
  		empno NUMBER PRIMARY KEY,
  		name VARCHAR2(100) NOT NULL,
  		job VARCHAR2(100) NOT NULL,
  		salary NUMBER NOT NULL
  	)
  	
  	-- 시퀀스 
  	CREATE SEQUENCE s_employee_seq;
  	
  	INSERT INTO s_employee(empno,name,job,salary) VALUES(s_employee_seq.nextval,'아이유','개발',700);  	
  	
  	INSERT INTO s_employee(empno,name,job,salary) VALUES(s_employee_seq.nextval,'강하늘','개발',900);
  	INSERT INTO s_employee(empno,name,job,salary) VALUES(s_employee_seq.nextval,'유재석','총무',600);
  	INSERT INTO s_employee(empno,name,job,salary) VALUES(s_employee_seq.nextval,'박보검','개발',900);
  	INSERT INTO s_employee(empno,name,job,salary) VALUES(s_employee_seq.nextval,'이상순','총무',600);
  	
  	INSERT INTO s_employee(empno,name,job,salary) VALUES(s_employee_seq.nextval,'손흥민','총무',900);
  	commit
  	
  	SELECT * FROM s_employee;
  	
  	-- 연습) 개발 job 의 사원 중 가장 높은 salary를 받는 사원들의 name과 salary와 job을 조회하세요 ( subquery 이용 ) 
  	-- 1) 개발 job 의 최고 salary 
  		   SELECT MAX(salary) FROM s_employee WHERE job='개발';
  	-- 2) 개발 job 사원 중 salary가 900 인 사원 
  		   SELECT name,salary,job FROM s_employee WHERE job='개발' AND salary=900;
  	
  	-- 1,2 를 subquery로 한번에 정의 
  	SELECT name,salary,job FROM s_employee 
  	WHERE job='개발' AND salary=(SELECT MAX(salary) FROM s_employee WHERE job='개발');
  		   
  		   
  		   
  		   
  		   
  		   
  		   
  		   





