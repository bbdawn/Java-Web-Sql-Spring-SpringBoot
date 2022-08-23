package org.kosta.myproject.service;

import java.util.List;

import org.kosta.myproject.entity.Product;
import org.kosta.myproject.repository.ProductRepository;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class ProductServiceImpl implements ProductService{
	private final ProductRepository productRepository;	
	@Override
	public List<Product> findAllByOrderByIdDesc() {		
		return productRepository.findAllByOrderByIdDesc();
	}
	@Override
	public Product findById(int id) {		
		return productRepository.findById(id).orElse(null);//존재하면 상품객체 반환하고 존재하지 않으면 null 반환  
	}
	@Override
	public void register(Product product) {
		productRepository.save(product);		
	}
	@Override
	public boolean existsById(int id) {		
		return productRepository.existsById(id);
	}	
	@Override
	public void deleteById(int id) {
		productRepository.deleteById(id);		
	}	
	@Override
	public void update(Product product) {		
		product.updateInfo(product.getName(), product.getMaker(), product.getPrice());
		productRepository.save(product);
	}
	/*
	 *  page 당 보여줄 상품 리스트 조회 : org.kosta.myproject.test.SpringbootstudyJpa2ApplicationTests pagination() method를 확인
	 */
	@Override
	public List<Product> findProductListByPageNo(int pageNo) {			
		int size=5;// 페이지당 보여줄 상품수 
		int page=pageNo-1;//0부터 시작
		PageRequest pageRequest = PageRequest.of(page, size, Sort.by("id").descending());		
		return productRepository.findAll(pageRequest).getContent();
	}
}





