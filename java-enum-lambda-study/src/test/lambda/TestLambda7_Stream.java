package test.lambda;

import java.util.ArrayList;

public class TestLambda7_Stream {
	public static void main(String[] args) {
		ArrayList<ProductVO> list=new ArrayList<ProductVO>();
		list.add(new ProductVO("1","갤럭시8","삼성",100));
		list.add(new ProductVO("2","G7","LG",120));	
		list.add(new ProductVO("4","아이폰4","애플",20));
		list.add(new ProductVO("3","갤럭시5","삼성",30));
		System.out.println("*******상품가격순으로 오름차순정렬**********");
		//참고 : compareTo 메서드 
		/*Integer i=11;
		Integer j=11;
		System.out.println(i.compareTo(j));*/ // i 가 j 보다 작으면 -1 , 같으면 0 , 크면 1을 반환한다 		
		// sorted 메서드의 매개변수에 인자값으로 람다식을 전달한다 
		// Comparator interface 의 추상메서드 구현부인 정렬로직을 람다식으로 전달하여 정렬되도록 한다 
		list.stream().sorted((a,b)->{
			if(a.getPrice()<b.getPrice()) {
				return 1;
			}else if(a.getPrice()==b.getPrice()) {
				return 0;
			}else {
				return -1;
			}
		}).forEach(System.out::println);
	}
}












