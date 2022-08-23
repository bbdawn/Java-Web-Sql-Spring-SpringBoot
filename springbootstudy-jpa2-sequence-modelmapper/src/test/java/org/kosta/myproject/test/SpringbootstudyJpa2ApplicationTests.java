package org.kosta.myproject.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.kosta.myproject.entity.Product;
import org.kosta.myproject.repository.ProductRepository;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
class SpringbootstudyJpa2ApplicationTests {
	@Resource
	ProductRepository productRepository;

	@Test
	void contextLoads() {
		log.info("repository {} ", productRepository.getClass());// Proxy
     }

	@Test
	public void insertProduct() {
		// 상품 등록 -> 상품아이디 ( sequence ) 는 자동생성되는 지 확인
		productRepository.save(new Product("비빔면", "팔도", 1100));
		// productRepository.save(new Product("진라면","오뚜기",1300));
		// Builder Pattern을 이용해 객체를 할당할 수 있다
		productRepository.save(Product.builder().name("진라면").maker("오뚜기").price(1300).build());
		// 상품수 조회
		log.info("product count {}", productRepository.count());
	}

	@Test
	public void findById() {
		// 상품아이디로 조회
		log.info("id로 검색 {}", productRepository.findById(1).get());

	}

	@Test
	public void findAllByOrderByIdDesc() {
		// 상품 아이디 내림차순 정렬
		List<Product> list = productRepository.findAllByOrderByIdDesc();
		for (Product p : list)
			log.info("{}", p);
	}

	@Test // Paging 처리 테스트를 위해 다수의 상품정보를 저장한다
	public void saveProductList() {
		for (int i = 0; i < 20; i++)
			productRepository.save(new Product("갤럭시" + i, "삼성", 10 * i));
	}

	@Test // Pagination 처리 테스트
	public void pagination() {
		/*
		페이지 관련 sql 을 실행하기 위해 application.properties에 아래와 같은 설정이 필요하다 
		
		# pagination sql 관련 jpa oracle 설정 ( 이 설정을 하면 oracle db에 맞는 sql 을 jpa가 생성해 실행한다 )
        spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.Oracle10gDialect
        # Oracle 11은 Oracle10gDialect를 명시하면 됨
		
		*/

		// 페이징 테스트 1 페이지(페이지는 0부터 시작) , 페이지당 상품 5개 , id 내림차순 정렬
		// 0은 1page , 1은 2page에 해당하는 상품 5개 이하의 id 내림차순으로 정렬된 리스트를 반환한다
    
		int page=1;
		int size=5;
		PageRequest pageRequest = PageRequest.of(page, size, Sort.by("id").descending());
		List<Product> list=productRepository.findAll(pageRequest).getContent();
        for(Product p:list)
        	log.info("{}",p);
		
		// 람다식으로도 출력해본다
		//list.forEach((product) -> System.out.println(product));

	}
}
