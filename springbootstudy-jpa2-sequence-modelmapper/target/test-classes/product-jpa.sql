DROP TABLE jpa_product;
DROP SEQUENCE jpa_product_seq;
/*
CREATE TABLE jpa_product(
	id NUMBER PRIMARY KEY,
	name VARCHAR2(100) NOT NULL,
	maker VARCHAR2(100) NOT NULL,
	price NUMBER NOT NULL
)
CREATE SEQUENCE jpa_product_seq;

INSERT INTO jpa_product VALUES(jpa_product_seq.nextval,'진라면순한맛','오뚜기',1000);
COMMIT
*/
SELECT * FROM jpa_product;

