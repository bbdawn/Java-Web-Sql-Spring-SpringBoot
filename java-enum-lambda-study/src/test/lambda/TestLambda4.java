package test.lambda;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class TestLambda4 {
	public static void main(String[] args) {
		Set<String> set=new HashSet<String>();
		set.add("A"); set.add("B"); set.add("C");
		// 기존 Iterator 방식으로 나열해 출력 
		Iterator<String> it=set.iterator();
		while(it.hasNext())
			System.out.println(it.next());
		System.out.println("**************");
		// 람다식으로 나열해본다. forEach 메서드에 람다식(익명함수)를 전달 
		set.forEach((a)->System.out.println(a));
	}
}
