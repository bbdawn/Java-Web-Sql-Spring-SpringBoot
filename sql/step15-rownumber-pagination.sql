/*
	row_number() over() : 조회된 row(행)에 대한 순차적인 번호를 제공하는 함수 
	
	Inline View : SQL 문장에서 FROM 절에 사용되는 SubQuery 
					FROM 절에 서브쿼리로 SELECT 되는 조회결과를 테이블처럼 사용 
					ex)  SELECT 컬럼,컬럼 
						  FROM (
						  	서브쿼리 
						  ) 별칭 
*/
drop table player;
create table player(
 no number primary key,
 title varchar2(100) not null,
 singer varchar2(30) not null,
 price number not null
)

select * from player;

create sequence mp3_seq;

insert into player(no,title,singer,price) values(mp3_seq.nextval,'잊어야 한다는 마음으로','아이유',700);
insert into player(no,title,singer,price) values(mp3_seq.nextval,'사람','지코',1000);
insert into player(no,title,singer,price) values(mp3_seq.nextval,'밤편지','아이유',1000);
insert into player(no,title,singer,price) values(mp3_seq.nextval,'도망가자','선우정아',1000);
insert into player(no,title,singer,price) values(mp3_seq.nextval,'그날','박효신',1000);
insert into player(no,title,singer,price) values(mp3_seq.nextval,'좋은밤 좋은꿈','너드커넥션',500);
insert into player(no,title,singer,price) values(mp3_seq.nextval,'사계','태연',600);
insert into player(no,title,singer,price) values(mp3_seq.nextval,'제발','이소라',1000);
commit
select count(*) from player;

SELECT * FROM player ORDER BY no desc;

DELETE FROM player WHERE no=7;

-- 조회된 결과 행 번호를 부여하기 위해 ROW_NUMBER() OVER(정렬) 함수를 이용 
SELECT ROW_NUMBER() OVER(ORDER BY no DESC) AS rnum,no,title FROM player;

-- rnum 이 3 이하인 곡들을 조회 : error   ROW_NUMBER 는 조회된 결과행에 대해 번호를 부여하기 때문 
SELECT ROW_NUMBER() OVER(ORDER BY no DESC) AS rnum,no,title FROM player WHERE rnum<=3;

-- Inline View ( FROM 절의 SUBQUERY ) 를 이용하면 된다 
SELECT rnum,no,title
FROM (
	SELECT ROW_NUMBER() OVER(ORDER BY no DESC) AS rnum,no,title FROM player
) WHERE rnum<=3

-- 한 페이지당 3곡을 제공 , 2page에 해당하는 3곡을 보여주고자 한다 
-- row number 기준으로 4 이상 6 이하의 곡을 조회하면 된다 
SELECT rnum,no,title
FROM (
	SELECT ROW_NUMBER() OVER(ORDER BY no DESC) AS rnum,no,title FROM player
) WHERE rnum BETWEEN 4 AND 6
















