package org.kosta.myproject.repository;

import java.util.List;

import org.kosta.myproject.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface ProductRepository extends JpaRepository<Product, Integer>{
	/*
	 
	 JPA에서 지원하는 키워드로 메서드명을 명시하면 원하는 정렬 , 검색 기능 등이 지원된다 
	 참고 
	 https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.query-methods
	 */
	List<Product> findAllByOrderByIdDesc();
	
}
