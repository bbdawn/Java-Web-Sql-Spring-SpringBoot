package test.lambda;
// 함수형 인터페이스 
@FunctionalInterface
interface Calculator{ // 함수형 인터페이스는 단 하나의 메서드만 선언이 가능 
	public int testRambda(int salary);
}
class HRService{
	public void printTotalCost(Calculator calculator) {
		System.out.println("**비용 연산 수행**");
		System.out.println(calculator.testRambda(100));
	}
}
public class TestLambda2 {
	public static void main(String[] args) {
		//1. 일반 클래스 방식 (아래 클래스를 정의)
		new HRService().printTotalCost(new MyCalculator());
		//2. 익명 클래스 방식 
		new HRService().printTotalCost(new Calculator() {			
			@Override
			public int testRambda(int salary) {
				return salary*3;
			}
		});		
		//3. 람다식 방식   
		new HRService().printTotalCost((int salary)->{
			System.out.println("**람다식 이용한 A 타입연산**");
			return salary*4;
		});
		new HRService().printTotalCost((int salary)->{
			System.out.println("**람다식 이용한 B 타입연산**");
			return salary*5;
		});
		
	}
}
class MyCalculator implements Calculator{
	@Override
	public int testRambda(int salary) {
		System.out.println("**일반 클래스 이용한 연산**");
		return salary*2;
	}	
}
