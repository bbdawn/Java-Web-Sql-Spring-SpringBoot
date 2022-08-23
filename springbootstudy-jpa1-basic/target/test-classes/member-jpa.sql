DROP TABLE jpa_member;
/*
CREATE TABLE jpa_member(
	id VARCHAR2(100) PRIMARY KEY,
	password VARCHAR2(100) NOT NULL,
	name VARCHAR2(100) NOT NULL,
	address VARCHAR2(100) NOT NULL
)

INSERT INTO jpa_member(id,password,name,address) VALUES('java','1','아이유','판교');
INSERT INTO jpa_member(id,password,name,address) VALUES('spring','2','김영남','무주');
INSERT INTO jpa_member(id,password,name,address) VALUES('jpa','1','이택조','철원');
COMMIT
*/

SELECT * FROM jpa_member;

delete from jpa_member where id='1';
commit