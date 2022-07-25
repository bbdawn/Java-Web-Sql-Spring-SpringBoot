/*
	CASCADE :  CASCADE 옵션이 적용된 Foreign key는 
				  상위 테이블 ( parent table ) 의 레코드(정보)가 삭제되면 
				  하위 테이블 ( child table ) 의 해당 레코드가 자동으로 삭제된다 
				  
                  예) 부서테이블( 상위 테이블 )의 10번 부서정보 삭제시에
                  	  이를 참조하는 사원테이블( 하위 테이블 )의 10번 부서 사원 정보도 함께 삭제된다  
*/
create table spring_department(
	deptno number primary key,
	dname varchar2(100) not null,
	loc varchar2(100) not null
)
create table spring_employee(
	empno number primary key,
	ename varchar2(100) not null,
	sal number not null,
	deptno number not null,
	constraint fk_spring_deptno foreign key(deptno) references spring_department(deptno) 
	on delete cascade
)

-- test 
create table demo_parent(
	id number primary key,
	name varchar2(100) not null
)
create table demo_child(
	child_no number primary key,
	content clob not null,
	id number not null,
	constraint fk_demo_id foreign key(id) references demo_parent(id)
)
insert into demo_parent(id,name) values(1,'점심메뉴');

insert into demo_child(child_no,content,id) values(1,'잔치국수',1);
insert into demo_child(child_no,content,id) values(2,'돈까스',1);

select * from DEMO_PARENT;
select * from DEMO_CHILD;
-- 현재 parent table 의 정보를 child table이 참조하므로 삭제 불가 
delete from demo_parent where id=1;

--- cascade 옵션이 적용된 table로 테스트 
insert into spring_department values(10,'전략기획','판교');

insert into spring_employee values(1,'아이유',300,10);
insert into spring_employee values(2,'강하늘',500,10);

commit

select * from spring_department;
select * from spring_employee;

--  on delete cascade 옵션이 설정되어  부모 테이블의 정보를 삭제하면 그를 참조하는 자식 테이블의 정보도
-- 함께 삭제된다  
delete from spring_department where deptno=10;



