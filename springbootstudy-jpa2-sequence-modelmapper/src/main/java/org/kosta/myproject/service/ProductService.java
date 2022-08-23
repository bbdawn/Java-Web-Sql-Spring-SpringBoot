package org.kosta.myproject.service;

import java.util.List;

import org.kosta.myproject.entity.Product;

public interface ProductService {

	List<Product> findAllByOrderByIdDesc();
	
	Product findById(int id);

	void register(Product product);

	boolean existsById(int id);
	
	void deleteById(int id);

	List<Product> findProductListByPageNo(int pageNo);

	void update(Product product);

	

}
