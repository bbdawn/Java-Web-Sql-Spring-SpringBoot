package test.lambda;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class TestLambda6_Stream {
	public static void main(String[] args) {
		ArrayList<ProductVO> list=new ArrayList<ProductVO>();
		list.add(new ProductVO("1","갤럭시8","삼성",100));
		list.add(new ProductVO("2","G7","LG",120));
		list.add(new ProductVO("3","갤럭시5","삼성",30));
		// 기존 loop 방식 
		for(ProductVO vo:list) {
			if(vo.getMaker().equals("삼성")&&vo.getPrice()>50) {
				System.out.println(vo);
			}
		}
		System.out.println("******************");
		List<ProductVO> list2 = Arrays.asList(new ProductVO("1","갤럭시8","삼성",100), new ProductVO("2","G7","LG",120),new ProductVO("3","갤럭시5","삼성",30));
		// 특정 조건 없이 람다식을 적용해 리스트의 첫번째 요소부터 마지막 요소까지 출력
        list2.forEach((vo)->System.out.println(vo));
        System.out.println("******************");
        list2.forEach(System.out::println);	
        System.out.println("******************");
        list.forEach(System.out::println);
        System.out.println("******************");
		/* java.util.stream.Stream : 
		 * 다양한 데이터 소스(list,map,set, File)를 표준화된 방법으로 다루기 위한 라이브러리
		 * Iterator와 유사하지만, 람다식으로 컬렉션의 요소를 처리할 수 있고
		 * 데이터 처리에 관한 다양한 메서드를 제공한다  
		 * Stream은 람다식으로 데이터 요소들을 처리할 수 있는 반복자의 역할을 한다  
		 * 
		 */		
		//리스트 요소 출력시 조건식을 부여 
		list.stream().filter(product->product.getMaker().equals("삼성")&&product.getPrice()>50).forEach(p->System.out.println(p));
	}
}















