ERD ( Entity Relationship Diagram ) 
: 개체 관계 모델링 즉 데이터 모델링을 위한 다이어그램 ​

ERWIN : ERD(entity-relationship diagram) Tool​

File -> New -> Logical/Physical 버튼 선택 
-> Logical 데이터 모델링부터 구성 

​ERWIN 환경 설정 
메뉴 Model - Model Propertie 선택
Model Properties 대화상자- 세번째 Notation탭에서 Logical Notation Physical Notation영역 모두 IE옵션 버튼을 선택

Model Properties 대화상자 - 네번째 Defaults 에서 Not Null 옵션으로 변경하고 Default DataType 은 논리 , 물리 모두 VARCHAR2(100) 으로 설정 

​
Entity명
----------
기본키
----------
일반속성영역

​
이미지 추출 
메뉴 Tools - Report Template Builder - Report Builder - Report Templates - Picture 선택후 화살표 클릭
- File -run - brower 뜨면 이미지 다운 가능

HTML 안나올때는 경로 변경
Report Template Builder -> Edit -> Properties ->Export탭-> Generated File 위치변경

​

​

Physical 모드에서 컬럼타입보기

DataType display
Format Tab -> Table Display -> Column DataType 

​
기본데이터타입변경 
Model Tab -> Model Properties -> Defaults -> VARCHAR2(100) 으로 변경

​
ERD ( Entity Relationship Diagram ) 
: 개체 관계 모델링 , 관계형 데이터베이스 설계를 위한 다이어그램 

​

논리 데이터 모델링 
- 논리적인 데이터 관리 및 관계를 정의한 모델.
전체 업무 범위와 업무 구성요소를 정의하고 확인할 수 있다. 

​물리 데이터 모델링 
- 논리 데이터 모델을 DBMS 특성에 맞게 구체화시킨 모델을 말한다 
​

식별관계 (identified relationship): 부모 테이블의 기본키 혹은 복합키(이후 공부예정)가 
자식 테이블의 기본키 혹은 복합키의 구성원으로
전이되는 관계 ( ex - 사원과 신체정보 ) 

​
비식별관계(non-identified relationship): 부모 테이블의 기본키 혹은 복합키가 
자식 테이블의 일반속성으로 전이되는 관계 
(ex - 부서와 사원정보 ) 







