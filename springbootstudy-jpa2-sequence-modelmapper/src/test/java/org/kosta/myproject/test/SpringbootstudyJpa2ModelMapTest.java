package org.kosta.myproject.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.kosta.myproject.dto.ProductDTO;
import org.kosta.myproject.entity.Product;
import org.kosta.myproject.repository.ProductRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class SpringbootstudyJpa2ModelMapTest {
	/*
	 DTO : Data Transfer Object 계층간 데이터 전송 역할 ex) ProductDTO
	 
	 Entity : DB 테이블과 대응되는 모델링 클래스 ex) entity.Product 테이블에 없는 필드를 가져서는 안됨
	 
	 Entity 와 DTO로 역할을 분리하는 것이 바람직
	 
	 View <-> Controller : DTO(Data Transfer Object)로 데이터 교환
	 Service<-->Repository : Entity 를 이용
	 
	 Entity와 DTO를 분리해야 하는 이유 
	 : Entity가 변하면 db에 반영되고 다른 로직에 영향을 미침 
	 예를 들면 API 서버와 사용자 시스템 사이에는 약속된 구조화된 데이터가 전송됨
	  만약 컨트롤러에서 Entity로 서비스를 할 경우 DB 변경 -> Entity 변경 ->  API Response 또한 변경된다 
	 즉 Entity 변경이 되면 명세화된 약속이 변경되는 구조다. 
	 또한 View와 연동하면서 데이터 	 변경이 필요한 경우가 있으므로 
	 ( Entity 를 변경하면 DB가 바뀔 수 있기 때문에 ) 
	 DTO와 Entity로 분리하는 것이 바람직하다
	 
	 ​ ModelMapper : Entity 와 DTO를 자동 Mapping 하는 역할을 함 maven pom.xml에 추가
	 <dependency> <groupId>org.modelmapper</groupId>
	 <artifactId>modelmapper</artifactId> <version>2.3.0</version> </dependency>
	*/
	@Resource
	ProductRepository productRepository;
	@Autowired
	private ModelMapper modelMapper;

	@Test
	public void testModelMapper() {
		ProductDTO productDTO = new ProductDTO(1, "새우깡", "농심", 1000);
		// DTO 를 Entity로 변환
		Product productEntity = modelMapper.map(productDTO, Product.class);
		log.info("entity {}", productEntity);
		// Entity를 DTO로 변환 
		ProductDTO productDTO2=modelMapper.map(productEntity, ProductDTO.class);
		log.info("dto {}", productDTO2);
	}

	@Test 
	public void findAllConvertModelMapper() { 
	  List<Product> entityList=productRepository.findAll(); 
	  //entityList 를 dto 배열 타입으로 반환  
	  ProductDTO [] dtoArray=modelMapper.map(entityList,ProductDTO[].class);	
	  for(ProductDTO dto:dtoArray)
		  log.info("{}",dto);		  
	}
}
