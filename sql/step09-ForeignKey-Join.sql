/*
		Foreign Key 제약조건과 Join SQL 
		
		- ERD ( Entity Relationship Diagram ) : 관계형 데이터베이스 설계를 위한 다이어그램 
		
		- 정규화 ( Normalization ) : 데이터베이스 설계시 중복을 최소화하고 무결성을 보장하기 위해 데이터를 구조화하는 작업 
									   ( 1, 2, 3 정규화에 대해 이후 공부 예정 ) 
		
		- Foreign Key 제약조건 :  참조 무결성 보장을 위한 제약조건 , 다른 테이블의 정보를 참조할 때 지정해야 하는 제약조건 
						             ex)  부모테이블 : 부서 ( 참조 대상이 되는 테이블 ) 
						             	   자식테이블 : 사원 ( 부서를 참조하는 테이블 ) 
						             	   				-> 사원의 부서번호 컬럼에 Foreign Key 제약조건을 명시한다
						             	  사원 테이블에 사원 정보가 저장되기 위해서는 반드시 부서테이블에 저장되어 있는 부서번호로만
						             	  저장될 수 있다 
						             	  즉 부서테이블에 존재하지 않는 부서번호로 사원테이블에 사원정보의 부서번호로 저장될 수 없다 
						             	  
		- Join SQL : 여러 테이블의 정보를 결합하여 조회하기 위한 SQL 	( 이번에는 기본 join 만 연습하고 상세한 것은 이후 공부 예정 )     
		
			   				 				
		사례)   사원정보관리 
		
			   	사원번호, 사원명, 직종, 월급 , 부서번호, 부서명 , 근무지, 부서대표번호 
			   	
			   	실제데이터
			   	1 		  아이유   개발  500   10			연구개발  판교   031
			   	2         박보검   개발  700   10        연구개발  판교   031			 					   				 					   				 					   				 					
			   				 					   				 						   				 					   				 								 					   				 					   				 					   				 							 					   				 					   				 					   				 				
			   	위와 같은 형태로 테이블을 설계해서 운영하면 사원에 대한 부서정보들이 중복되어 저장된다 		 					   				 				
			   	또한 부서정보가 업데이트되면 사원수만큼 다수의 데이터가 변경되어야 한다 			 					   				 					   				 					   				 					   				 					   				 				
				정규화 과정을 거치면 
				
				부서 테이블 |-----0|<- 사원 테이블 
				
				하나의 부서는 사원을 0 or 1 or 다수를 가질 수 있다 
				한명의 사원은 하나의 부서에 속해 있다 
				
	            이렇게 테이블을 분리하여 관리할 때는 참조 무결성 보장을 위해 사원의 부서번호 컬럼에 제약조건 Foreign Key를 지정해야 함 					             	   				 				 						             	   				 				 						             	   				 				 				
	*/	 				 				 				
						             	   				 				 				 				 				 				
	-- 테이블 생성 순서는 참조대상이 되는 부모 테이블부터 만들어야 한다 
	
	CREATE TABLE  department(
		deptno NUMBER PRIMARY KEY,
		dname VARCHAR2(100) NOT NULL,
		loc VARCHAR2(100) NOT NULL,
		tel VARCHAR2(100) NOT NULL
	)
									   							   
    CREATE TABLE k_employee(
    	empno NUMBER PRIMARY KEY,
    	ename VARCHAR2(100) NOT NULL,
    	sal NUMBER NOT NULL,
    	job VARCHAR2(100) NOT NULL,
    	deptno NUMBER NOT NULL,
    	CONSTRAINT fk_deptno FOREIGN KEY(deptno) REFERENCES department(deptno)
    )

    -- FOREIGN KEY :  CONSTRAINT 제약조건명 FOREIGN KEY(현테이블의 컬럼명) REFERENCES 참조대상테이블명(참조테이블의 컬럼명)
    
    -- 부모테이블 : 참조대상이 되는 테이블    ,   자식테이블 : 참조하는 테이블 
	
    -- parent key not found error : 이유는 현재 참조대상테이블 부서의 10번 부서 정보가 없기 때문 
    -- FOREIGN KEY 제약조건 위배 or 참조무결성 제약조건 위배 
	INSERT INTO k_employee(empno,ename,sal,job,deptno) VALUES(1,'아이유',500,'개발',10);

	INSERT INTO department(deptno,dname,loc,tel) VALUES(10,'연구개발부','오리','031');
	INSERT INTO department(deptno,dname,loc,tel) VALUES(20,'공공사업부','종로','02');
	INSERT INTO department(deptno,dname,loc,tel) VALUES(30,'전략기획부','판교','031');
	
	INSERT INTO k_employee(empno,ename,sal,job,deptno) VALUES(2,'박보검',400,'개발',10);
	INSERT INTO k_employee(empno,ename,sal,job,deptno) VALUES(3,'강하늘',700,'총무',20);
	
	 -- parent key not found error : 이유는 현재 참조대상테이블 부서의 40번 부서 정보가 없기 때문 
    -- FOREIGN KEY 제약조건 위배 or 참조무결성 제약조건 위배 
	INSERT INTO k_employee(empno,ename,sal,job,deptno) VALUES(4,'김태리',700,'총무',40);
    -- 10번 부서가 존재하므로 SUCCESS
	INSERT INTO k_employee(empno,ename,sal,job,deptno) VALUES(4,'김태리',700,'총무',10);
    COMMIT

	SELECT * FROM department
    SELECT * FROM k_employee

   /*
    	 사원번호가 1 인 사원의 사원명, 월급, 직종, 부서명, 근무지를 조회하고자 한다 
    	 사원 테이블과 부서 테이블의 정보를 결합해서 조회해야 한다 -> JOIN SQL 
    	 
    	 방법 1
    	 SELECT 컬럼명, 컬럼명 
    	 FROM 테이블명 별칭, 테이블명 별칭  
    	 WHERE 별칭.컬럼명=별칭.컬럼명 
    	 
    	 방법 2
    	 SELECT 컬럼명,컬럼명
    	 FROM 테이블명 별칭
    	 INNER JOIN 테이블명 별칭 ON 별칭.컬럼명=별칭.컬럼명 
    */
	-- JOIN SQL 을 이용해 사원과 부서테이블의 정보를 결합해서 조회 
    SELECT e.empno,e.ename,e.sal,e.job,d.dname,d.loc
    FROM	department d, k_employee e
	WHERE d.deptno=e.deptno AND e.empno=1;
    
    -- 아래와 같이 JOIN을 기술할 수 있다 
    SELECT e.empno,e.ename,e.sal,e.job,d.dname,d.loc
    FROM department d
    INNER JOIN k_employee e ON d.deptno=e.deptno
    WHERE e.empno=1;
	
	
	
	
	
	
	
    
    
    
    
									   							   							   							   							   							   
