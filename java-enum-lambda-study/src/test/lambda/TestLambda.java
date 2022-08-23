package test.lambda;
class Worker implements Runnable{
	@Override
	public void run() {
		System.out.println("일반 클래스 방식으로 정의해서 스레드 실행됨");
	}		
}
public class TestLambda {
	
	public static void main(String[] args) {
		//case1 : 일반 클래스 방식 
		new Thread(new Worker()).start();
		
		//case2 : 익명 클래스 방식 
		new Thread(new Runnable() {
			@Override
			public void run() {
				System.out.println("익명 클래스 방식으로 정의해서 스레드 실행됨");
			}			
		}).start();
		
		//case3 : 람다식 방식 
		/*
		 	람다식 (lambda expression) : 익명 함수를 지칭하는 용어 
		 	메서드를 하나의 식으로 표현한 것 
		 	() : 메서드의 매개변수 리스트 영역 
		 	-> : 람다식 시작 토큰 
		 	{} : 구현부 ( 추상 메서드를 오버라이딩하는 영역 )
		 	
		 	(매개변수목록) -> {함수몸체} 
		 	
		 */		
		new Thread(()->{System.out.println("람다 표현식으로 정의해서 스레드 실행됨");	}).start();
	}
}




