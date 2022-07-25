/*
     IN 연산자 
     특정값이 포함되는 데이터를 조회하고자 할 때 사용하는 연산자 
     
     SELECT 컬럼,컬럼
     FROM 테이블명 
     WHERE 컬럼 IN('데이터','데이터')
     
     ex)  maker가 농심 또는 오뚜기 인 상품의 정보들을 조회 
     
     NOT IN 연산자 
     특정값이 포함되지 않는 데이터를 조회하고자 할 때 사용 
     
     SELECT 컬럼,컬럼
     FROM 테이블명 
     WHERE 컬럼 NOT IN('데이터','데이터')
     
     ex)  maker가 농심 또는 오뚜기가 아닌 상품의 정보들을 조회 
*/
create table food(
	id number primary key,
	name varchar2(100) not null,
	maker varchar2(100) not null,
	price number not null
)

create sequence food_seq;

insert into food(id,name,maker,price) values(food_seq.nextval,'후라이드','또래오래',15000);
insert into food(id,name,maker,price) values(food_seq.nextval,'소곱창','대한곱창',20000);
insert into food(id,name,maker,price) values(food_seq.nextval,'양념치킨','또래오래',16000);
insert into food(id,name,maker,price) values(food_seq.nextval,'참치회','이춘복참치',35000);
insert into food(id,name,maker,price) values(food_seq.nextval,'파닭','또래오래',17000);
insert into food(id,name,maker,price) values(food_seq.nextval,'미니전골','대한곱창',18000);

commit

SELECT count(*) FROM food;

-- maker가 대한곱창 , 이춘복참치 인 food 정보를 조회 
SELECT id,name,maker,price
FROM food
WHERE maker IN('대한곱창','이춘복참치')

-- 위 SQL을 아래와 같이 표현할 수 있다 
SELECT id,name,maker,price
FROM food
WHERE maker='대한곱창' or maker='이춘복참치'


-- maker가 대한곱창 , 이춘복참치가 아닌 food 정보를 조회 
SELECT id,name,maker,price
FROM food
WHERE maker NOT IN('대한곱창','이춘복참치')

-- 위 SQL을 아래와 같이 표현할 수 있다 
SELECT id,name,maker,price
FROM food
WHERE maker<>'대한곱창' AND maker<>'이춘복참치'

-- 연습) 전체 음식의 평균가보다 MAKER별 음식 평균가가 낮은 MAKER의 음식정보(NAME,PRICE,MAKER) 를 PRICE 내림차순으로 조회하고자 한다 
/*
 	소곱창        20000    대한곱창
 	미니전골      18000    대한곱창
 	파닭	       17000   또래오래
 	양념치킨	  ....	
 	후라이드       .. 
 */
-- step1 전체음식평균가 2016.66..
SELECT AVG(price) FROM food;
-- step2 maker별 음식평균가 - 대한곱창, 또래오래 
SELECT maker,AVG(price) FROM food GROUP BY maker
-- step3 전체음식 평균가보다 maker별 음식평균가가 낮은 maker를 조회 ( groupby ~ having (subquery) ) 
SELECT maker
FROM food
GROUP BY maker
HAVING AVG(price)<(SELECT AVG(price) FROM food)

-- 연습문제를 IN(subquery) 을 이용해 풀이 
SELECT name,price,maker 
FROM food
WHERE maker IN(
	SELECT maker
	FROM food
	GROUP BY maker
	HAVING AVG(price)<(SELECT AVG(price) FROM food)
)
ORDER BY price DESC

SELECT * FROM s_employee;
-- job 개발 4명  총무 3명  기획 1명 

-- 연습)  job 별 사원수가 3명 이상인 job( 개발 , 총무 ) 에 해당하는 사원의 empno, name과 job을 조회 (empno 내림차순 )

-- job 별 사원수가 3명 이상인 job ( GROUP BY ~ HAVING ) 
SELECT job
FROM s_employee
GROUP BY job
HAVING count(*)>=3

-- IN 을 이용해 위 SQL을 subquery로 적용 
SELECT empno,name,job FROM s_employee
WHERE job IN(
	SELECT job
	FROM s_employee
	GROUP BY job
	HAVING count(*)>=3
) ORDER BY empno DESC










