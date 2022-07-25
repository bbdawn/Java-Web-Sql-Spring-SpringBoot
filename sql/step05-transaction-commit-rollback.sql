/*
 	Transaction ( 트랜잭션 ) : 작업단위 , 더 이상 쪼갤 수 없는 작업단위 -> 원자성 
 								 데이터베이스의 상태를 변경시키기 위해 수행하는 작업단위 
 								 
 	Transaction 관련 DCL -> COMMIT , ROLLBACK 		
 	
 			 - COMMIT : 변경된 작업 내용을 실제 데이터베이스에 반영 
 			 - ROLLBACK : 변경된 작업 내용을 취소하고 이전 상태로 되돌림 	
 			 
 	 사례 )  카드 발급하면 포인트 지급을 고객에게 약속
 	 		 -> 카드 발급 트랜잭션 ( 카드 발급 + 포인트 발급 ) 
 	 		     1. 카드 발급
 	 		     2. 약속한 포인트 지급 
 	 		     1, 2번 두 사항이 모두 정상적으로 실행되었을 때만 실제 DB에 저장되어야 한다 -> COMMIT 
 	 		     만약 트랜잭션 내부의 문제가 발생했을 경우 ( 예를 들면 카드 발급이 정상적으로 진행되고 
 	 		     포인트 발급시 문제 발생 ) 에는 ROLLBACK 처리를 해서 
 	 		     작업 내용을 취소(1. 카드발급취소) 하고 이전 상태로 되돌려야 한다 
 	 		     
 	 - java application ( jdbc ) 에서 트랜잭션 처리 
 	   
 	   JDBC 트랜잭션 설정 : auto commit 이 기본 , 수동 모드로 변경하려면 connection.setAutoCommit(false) 를 명시 
 	   						   
 	   트랜잭션 처리를 위해 수동 커밋 모드로 변경 
 	   트랜잭션 내 세부 업무의 실행이 모두 정상적으로 수행될 때  connection. commit(); ->  실제 db에 반영 
 	   문제가 발생했을 때 connection.rollback(); 	-> 작업취소 원상복귀 
 	   
 	   try{
 	   		수동커밋모드 
 	   		카드발급
 	   		포인트발급 
 	   		commit 
 	   }catch{
 	   		rollback
 	   }		   	 	 				   	 	 
 	 		  		 		 					 		 					  		 		 					 		 					 
 	 		  		 		 					 		 					  		 		 					 		 					 		  		 		 					 		 					  		 		 					 		 					 		  		 		 					 		 					  		 		 					 		 					 
 */











