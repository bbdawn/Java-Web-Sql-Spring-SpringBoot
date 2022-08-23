package test.lambda;

import java.util.HashMap;
import java.util.Iterator;

public class TestLambda5 {
	public static void main(String[] args) {
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("a", "아이유");
		map.put("b", "장기하");
		map.put("c", "박보검");
		//기존 방식
		Iterator<String> it=map.keySet().iterator();
		while(it.hasNext()) {
			String key=it.next();
			System.out.println("key:"+key+" "+" value:"+map.get(key));
		}
		System.out.println("**********");
		//람다식 : 요소 처리 로직만 정의해서 전달 
		map.forEach((key,value)->System.out.println("key:"+key+" "+" value:"+value));
	}
}
