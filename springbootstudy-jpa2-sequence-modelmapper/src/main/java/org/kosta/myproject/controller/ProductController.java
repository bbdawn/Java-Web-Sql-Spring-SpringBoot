package org.kosta.myproject.controller;

import java.util.List;

import org.kosta.myproject.dto.ProductDTO;
import org.kosta.myproject.entity.Product;
import org.kosta.myproject.service.ProductService;
import org.modelmapper.ModelMapper;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@SuppressWarnings({ "unchecked", "rawtypes" })
@Slf4j
@AllArgsConstructor
@RestController // @Controller + @ResponseBody
public class ProductController {

	private final ProductService productService;
	private final ModelMapper modelMapper;
	@GetMapping("/products")
	public ProductDTO[] getAllProductList() {
		// modelMapper를 이용해 Entity Product List를 ProductDTO 배열로 변환해 리턴 => @RestController에 의해 JSONArray로 응답  
		return modelMapper.map(productService.findAllByOrderByIdDesc(),ProductDTO[].class);
	}

	/*
	 * @PathVariable : url 정보를 변수로 할당받기 위한 어노테이션 {id} 자리에 해당 어노테이션이 선언된 변수로 데이터가
	 * 할당된다
	 */

	@GetMapping("/products/{id}")
	public ResponseEntity findProductById(@PathVariable("id") int id) {
		Product product = productService.findById(id);
		if (product!=null) { // ModelMapper로 Entity를 DTO로 변환해 응답 =>  @RestController에 의해 JSONObject로 응답			
			return new ResponseEntity(modelMapper.map(product, ProductDTO.class), HttpStatus.OK);
		}
		return new ResponseEntity("상품이 존재하지 않습니다", HttpStatus.NOT_FOUND);
	}

	@PostMapping(value = "/products")
	public ResponseEntity registerProduct(ProductDTO productDTO) {		
		log.info("Request Method : POST");
		//DTO를 Entity로 변환해 서비스로 전달한다 
		productService.register(modelMapper.map(productDTO,Product.class));
		return new ResponseEntity("상품등록완료", HttpStatus.OK);		
	}

	@DeleteMapping("/products/{id}")
	public ResponseEntity deleteProduct(@PathVariable int id) {
		log.info("Request Method : DELETE");
		if (productService.existsById(id)) {
			productService.deleteById(id);
			return new ResponseEntity(id + " id 상품정보삭제완료", HttpStatus.OK);
		} else {
			return new ResponseEntity(id + "상품 아이디에 대한 상품이 없어 삭제 불가", HttpStatus.NOT_FOUND);
		}
	}

	@PutMapping("/products")
	public ResponseEntity updateProduct(ProductDTO productDTO) {
		log.info("Request Method : PUT {}" , productDTO);
		if (productService.existsById(productDTO.getId())) {
			productService.update(modelMapper.map(productDTO, Product.class));
			return new ResponseEntity(productDTO.getId() + " id 상품정보수정완료", HttpStatus.OK);
		} else {
			return new ResponseEntity(productDTO.getId() + "번 상품 아이디에 대한 상품이 없어 수정불가", HttpStatus.NOT_FOUND);
		}
	}
	
	// 페이지별 상품리스트를 조회하기 위한 메서드 
	// src/test/java 의 unitTest 마지막 부분에서 상품데이터를 저장한 후 테스트해본다 
	@GetMapping("/products/page/{pageNo}")
	public ProductDTO[] getAllProductList(@PathVariable int pageNo) {
		List<Product> entityList=productService.findProductListByPageNo(pageNo);		
		return modelMapper.map(entityList,ProductDTO[].class);
	}
}
