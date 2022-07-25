/*
		GROUP BY ~ HAVING 

		GROUP BY : 테이블에서 특정 컬럼을 기준으로 그룹화하여 검색할 때 사용 
					  데이터를 원하는 그룹으로 나눌 수 있다 
					  
		HAVING : GROUP BY와 함께 사용하는 조건절 ( 그룹에 대한 조건을 지정 ) 
		
		예 ) 상품 테이블에서 제조사별 상품수, 평균가 등 
			 사원 테이블에서 직종별 사원수, 평균월급 등 		  					  		

*/

SELECT * FROM product

-- maker 별 상품수 
SELECT maker,COUNT(*) as 상품수	
FROM product
GROUP BY maker
ORDER BY 상품수 DESC

-- maker별 상품수를 조회하되 상품수가 1개를 초과하는 maker 들만 조회 , HAVING 을 이용 
SELECT maker, COUNT(*) as 상품수
FROM product
GROUP BY maker
HAVING COUNT(*)>1
ORDER BY 상품수 DESC

-- maker별 상품평균가(AVG(컬럼))를 조회하되 평균가 내림차순으로 정렬 
SELECT maker,AVG(price) as 평균가
FROM product
GROUP BY maker
ORDER BY 평균가 DESC

-- maker별 상품평균가가 1550 을 초과하는 maker , 상품수, 평균가를 상품수 오름차순으로 조회 
SELECT maker,COUNT(*) AS 상품수, AVG(price) AS 평균가 
FROM product
GROUP BY maker
HAVING AVG(price)>1550
ORDER BY 상품수 ASC


SELECT * FROM s_employee;

-- job을 기준으로 그룹화하여   job,사원수를 사원수 내림차순으로 정렬 
SELECT job, COUNT(*) AS 사원수
FROM s_employee
GROUP BY job
ORDER BY 사원수 DESC

-- job 을 기준으로 그룹화하여 job,평균월급을 조회하되 평균월급이 700이상 job에 한해서 조회한다 ( 평균월급 내림차순 ) 
SELECT job,AVG(salary) AS 평균월급
FROM s_employee
GROUP BY job
HAVING AVG(salary)>=700
ORDER BY 평균월급 DESC

/*
 	부서별 평균월급 
 	개발  875
 	총무  700
 	기획  500	
 	
 	전체사원 평균월급 763
 */
SELECT ROUND(AVG(salary)) FROM s_employee;

-- 전체 사원의 평균 월급(763)보다 job 별 평균월급액이 작은 job의  job,평균월급을 조회 ( 평균월급 내림차순 ) 
/*
    총무  700
 	기획  500	
 */
SELECT job,AVG(salary) AS 평균월급
FROM s_employee
GROUP BY job
HAVING AVG(salary)<(SELECT ROUND(AVG(salary)) FROM s_employee)
ORDER BY 평균월급 DESC











