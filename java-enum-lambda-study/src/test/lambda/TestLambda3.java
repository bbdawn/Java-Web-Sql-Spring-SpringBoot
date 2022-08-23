package test.lambda;

import java.util.ArrayList;
import java.util.List;

public class TestLambda3 {
	public static void main(String[] args) {
		List<String> list=new ArrayList<String>();
		list.add("A"); list.add("B"); list.add("C");
		// 방식 1 
		for(int i=0;i<list.size();i++) 
			System.out.println(list.get(i));
		System.out.println("***********");
		// 방식 2
		for(String s:list)
			System.out.println(s);
		System.out.println("***********");
		// 방식 3 : 람다식 표현 jdk 1.8 이상 지원, 요소 처리 로직만 정의해서 전달 
		list.forEach((x)->System.out.println(x));
		
		System.out.println("***********");
		// ::  method reference 방식으로 람다식의 축약하는 형태 : 
		// 파라미터를 별도로 전달하지 않을 때 사용가능 
		list.forEach(System.out::println);	
	}
}






