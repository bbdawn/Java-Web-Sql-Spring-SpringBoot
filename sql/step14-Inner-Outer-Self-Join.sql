/*
	Join SQL : 여러개의 (or 하나 이상의) 테이블의 정보를 결합하기 위한 SQL 

	1. INNER JOIN : 테이블 간의 상응하는 컬럼의 정보가 존재할때 조회 : 부서와 사원테이블에서 부서번호에 해당하는 사원의 사원정보와 부서정보를 조회할때 사용
	
	                      일반적인 Join 을 의미 
						  여러 테이블을 결합할 때 , 지정한 컬럼의 데이터가 존재할 때 사용하는 join 
						  예 ) 부서 테이블의 부서번호와 사원 테이블의 부서번호가 일치할 때 부서와 사원정보를 join 해서 조회 
						  
	2. OUTER JOIN : 테이블 간의 상응하는 컬럼의 정보가 존재하지 않을 때에도 조회 : 부서와 사원테이블에서 사원이 존재하지 않는 부서정보까지 모두 조회할때 사용 	
	
	                      여러 테이블 중 한 쪽에서는 데이터가 있고 , 다른 한쪽에는 데이터가 없는 경우
						 데이터가 있는 쪽 테이블의 내용을 모두 출력 
						 예 ) 부서 테이블에는 40번 부서정보가 존재하는 데 
						 	  사원 테이블에는 40번 부서의 사원정보가 존재하지 않을 경우
						 	  사원이 없는 부서 테이블의 부서정보도 모두 조회하기 위해 Outer Join 을 이용 
						 	  
	3. SELF JOIN : 동일한 테이블 상에서의 조인 
						예 ) 사원 테이블의 매니저 컬럼 정보는 또 다른 사원의 사원번호이다.
							 이를 이용해 사원 정보와 그 사원의 관리자인 매니저 정보를 함께 조회할 때 self join 을 사용 
							 
							 
*/

/*
 		1. Inner Join : 테이블 간의 상응하는 컬럼의 정보가 존재하면 조회 
 */
-- 사원은 10,20,30번 부서에만 속해 있음 
SELECT * FROM emp;
-- 10,20,30,40 번 부서가 있음 
SELECT* FROM dept;

-- INNER JOIN : 부서 테이블(dept) 과 사원 테이블(emp) 의 정보를 결합 
-- 사원 정보와 그 사원이 속한 부서 정보를 조회 Inner Join : 일치하는 정보가 없는 부서 테이블의 40번 부서 정보는 조회되지 않는다  
SELECT e.empno,e.ename,e.job,d.deptno,d.dname,d.loc	
FROM	emp e,dept d
WHERE	e.deptno=d.deptno

-- ANSI SQL ( American National Standards Institute : 미국표준협회 ) : 데이터베이스 표준 SQL -> 특정 벤더에 종속적이지 않는 SQL

 SELECT e.empno,e.ename,e.job,d.deptno,d.dname,d.loc
 FROM emp e INNER JOIN dept d ON e.deptno=d.deptno;

-- INNER JOIN :      사원 테이블(emp) 과 월급등급 테이블(salgrade) 의 정보를 결합 
					  --     sal				  losal   , 		hisal 	, 	grade 
					  --  사원의 월급			  최저액이상   최고액이하  그에 따른 등급     	 
 -- SMITH 사원은 sal 이 800 이므로 월급등급은 1이다 
 SELECT * FROM salgrade;
 SELECT * FROM emp WHERE ename='SMITH';

-- SMITH 사원의 empno,ename,job,sal,grade 를 INNER JOIN을 이용해 조회 
SELECT e.empno,e.ename,e.job,e.sal,s.grade,s.losal,s.hisal
FROM emp e,salgrade s
WHERE e.sal>=s.losal
AND e.sal<=s.hisal
AND e.ename='SMITH' 
 
-- ANSI SQL 로 Inner JOIN 표현 
SELECT e.empno,e.ename,e.job,e.sal,s.grade,s.losal,s.hisal
FROM  emp e
INNER JOIN salgrade s
ON e.sal>=s.losal AND e.sal<=s.hisal
WHERE e.ename='SMITH';

--  SQL 연습 : emp 의 empno가 7521 인 사원의 ename과 dept 의 deptno,dname, salgrade의 grade를 조회해본다 
SELECT	e.ename,d.deptno,d.dname,s.grade
FROM emp e,dept d,salgrade s
WHERE e.deptno=d.deptno AND e.sal>=s.losal AND e.sal<=s.hisal
AND e.empno=7521

-- ANSI SQL 
SELECT	e.ename,d.deptno,d.dname,s.grade
FROM emp e
INNER JOIN dept d ON e.deptno=d.deptno
INNER JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
WHERE e.empno=7521

/*
 2. OUTER JOIN : 여러 테이블 중 한 쪽에서는 데이터가 있고 , 다른 한쪽에는 데이터가 없는 경우
						 데이터가 있는 쪽 테이블의 내용을 모두 출력 
						 예 ) 부서 테이블에는 40번 부서정보가 존재하는 데 
						 	  사원 테이블에는 40번 부서의 사원정보가 존재하지 않을 경우
						 	  사원이 없는 부서 테이블의 부서정보도 모두 조회하기 위해 Outer Join 을 이용
 */
-- 부서테이블에는 10,20,30,40번 부서정보가 존재 
SELECT DISTINCT deptno FROM dept;
-- 사원테이블에는 10,20,30번 부서 사원들이 존재 
SELECT DISTINCT deptno FROM emp;
-- inner join 에서는 결과행이 14 : 40번 부서에 해당하는 사원이 존재하지 않으므로 부서테이블의 40번 정보는 조회되지 않는다 
SELECT d.deptno,d.dname,e.empno,e.ename
FROM	dept d,emp e
WHERE d.deptno=e.deptno;
-- outer join : 조인 즉 결합할 정보가 없는 측 조건에 (+) 기호를 명시 , 부서테이블의 부서정보 40 이 존재 , 사원테이블의 40번 사원정보가 존재 x 
-- outer join 에서는 결과행이 15 : 40번 부서에 해당하는 사원이 존재하지 않아도 부서테이블의 40번 부서정보를 조회한다  
SELECT d.deptno,d.dname,e.empno,e.ename
FROM	dept d,emp e
WHERE d.deptno=e.deptno(+);

-- ANSI SQL : LEFT Outer Join -> 왼쪽 테이블을 기준으로 해서 오른쪽 테이블의 정보를 결합 
SELECT d.deptno,d.dname,e.empno,e.ename
FROM dept d
LEFT OUTER JOIN emp e ON d.deptno=e.deptno 
-- RIGHT OUTER JOIN -> 오른쪽 테이블을 기준으로 결합 
SELECT d.deptno,d.dname,e.empno,e.ename
FROM emp e
RIGHT OUTER JOIN dept d ON d.deptno=e.deptno 


/*
 	3. SELF JOIN : 동일한 테이블 상에서의 조인 
 					   동일한 테이블이지만 개념적으로 다른 정보를 결합 
						예 ) 사원 테이블의 매니저 컬럼 정보는 또 다른 사원의 사원번호이다.
							 이를 이용해 사원 정보와 그 사원의 관리자인 매니저 정보를 함께 조회할 때 self join 을 사용  
 */
	SELECT * FROM emp;
	-- 7902 사원번호의 매니저 번호 7566 이다 , 7566 은 또 다른 사원의 사원번호이다 -> 사원의 매니저 번호란 관리자의 사원번호를 의미한다  
	SELECT empno,ename,mgr FROM emp WHERE empno=7902;
	SELECT empno,ename,mgr FROM emp WHERE empno=7566;
    
	-- 7902 empno 의 ename과 mgr , 매니저명(또 다른 사원의 ename) 을 조회하고자 한다 : 이 때 self join을 이용 
	SELECT e.ename,e.mgr,m.empno as "매니저의 사원번호",m.ename as 매니저명
	FROM emp e,emp m
	WHERE e.mgr=m.empno
	AND e.empno=7902

	-- 전체 사원을 대상으로 SELF JOIN 해서 사원의 e.empno,e.ename,e.mgr,m.ename as 매니저명을 모두 조회해본다 
	SELECT e.empno,e.ename,e.mgr,m.ename as 매니저명
	FROM emp e,emp m
	WHERE e.mgr=m.empno
    -- 위 self join sql을 실행하면 13명의 사원이 조회된다 
    -- 총사원수는 14명 , 이유는 mgr이 없는 king 사원이 제외되었기 때문에 13명이 조회된다 -> self join 이 inner join 으로 적용되었기 때문 
    -- mgr 즉 매니저가 존재하지 않는 사원까지 모두 조회하고자 한다면 Outer Join을 적용하면 된다 
    -- Outer Join 연산기호 (+) 는 존재하지 않는 정보의 조건에 명시 : king 사원정보는 존재하고 매니저 정보가 존재하지 않으므로 매니저 측에 (+) 을 명시 
	SELECT e.empno,e.ename,e.mgr,m.ename as 매니저명
	FROM emp e,emp m
	WHERE e.mgr=m.empno(+)
	
    -- ANSI SQL로 표현 : table1 LEFT OUTER JOIN table2   : 왼쪽의 table1을 기준으로 table2 정보를 결합 , table 1의 모든 정보가 조회 
    SELECT e.empno,e.ename,e.mgr,m.ename as 매니저명
	FROM	emp e
	LEFT OUTER JOIN emp m
	ON	 e.mgr=m.empno
	
	-- JOIN SQL 연습 
	-- empno 가 7369인 사원의 사원명ename,부서명dname,월급등급grade,매니저명mgr의 ename 을 조회 
	-- table : emp , dept , salgrade 
	
	-- 답 : SMITH , RESERCH , 1, FORD  
	
	SELECT e.ename,d.dname,s.grade,m.ename
	FROM emp e, dept d, salgrade s, emp m
	WHERE e.deptno=d.deptno
	AND e.sal between s.losal AND s.hisal
	AND e.mgr=m.empno
	AND e.empno=7369
	
	-- ANSI SQL 
	SELECT e.ename,d.dname,s.grade,m.ename
	FROM emp e
	INNER JOIN dept d ON e.deptno=d.deptno
	INNER JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
	INNER JOIN emp m ON e.mgr=m.empno
	WHERE e.empno=7369
	
	-- JOIN SQL 연습 
	-- 전체 사원의 사원명ename,부서명dname,월급등급grade,매니저명mgr의 ename 을 조회하되 매니저가 없는 사원까지 모두 조회한다  
	-- table : emp , dept , salgrade 
	
	-- outer join 연산기호 (+) 는 데이터가 없는 측의 조인조건에 기술 
    SELECT e.ename,d.dname,s.grade,m.ename
	FROM emp e, dept d, salgrade s, emp m
	WHERE e.deptno=d.deptno
	AND e.sal between s.losal AND s.hisal
	AND e.mgr=m.empno(+)
	
	-- ANSI SQL 
	SELECT e.ename,d.dname,s.grade,m.ename
	FROM emp e
	INNER JOIN dept d ON e.deptno=d.deptno
	INNER JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal
	LEFT OUTER JOIN emp m ON e.mgr=m.empno
	
	-- 월급등급 salgrade 의 grade 를 기준으로 사원테이블의 사원의 월급등급에 따른 사원수 조회 
	/*
	 	  월급등급		사원수
	 	  1			     3
	 	  2             3
	 	  3             2 
	 	  4             5
	 	  5             1
	 */
	-- join table : emp , salgrade 
	/*
	 	select grade as 월급등급,count(*) as 사원수 
	 	from (
	 		subquery : join sql 
	 	) group by grade 
	 	
	 	from 절에서 사용하는 subquery를 inline view 라고 한다 
	 */
	 -- subquery : inline view 에 들어갈 join sql 
	  SELECT s.grade
	 FROM emp e, salgrade s
	 WHERE e.sal BETWEEN s.losal AND s.hisal 
	
	-- join sql 을 from 절에서 subquery로 적용한다 
		SELECT grade	 as 월급등급,count(*) as 사원수  
		FROM(	 
		     SELECT s.grade
			 FROM emp e, salgrade s
			 WHERE e.sal BETWEEN s.losal AND s.hisal
		)	GROUP BY grade  
		ORDER BY grade
	 
	-- 순위 조회 : RANK() OVER(ORDER BY COLUMN)
	SELECT ename,job,sal,RANK() OVER(ORDER BY sal DESC) as ranking FROM emp;	
	
	-- 월급 랭킹 5위까지의 사원정보를 조회 
	-- 월급 순위는 select 시점에 매겨짐 , where 절이 먼저 수행되므로 error 
	SELECT ename,job,sal,RANK() OVER(ORDER BY sal DESC) as ranking FROM emp WHERE ranking<=5;	
	-- from 절 이하에서 subquery 를 이용해 랭킹을 매긴 후 외부 sql에서 where 절을 수행 
	
	SELECT *
	FROM(
		SELECT ename,job,sal,RANK() OVER(ORDER BY sal DESC) as ranking FROM emp
	) WHERE ranking<=5;
	
	
	
	
	
	
	
	
	
	
	
	
