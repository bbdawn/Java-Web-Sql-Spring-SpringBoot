package org.kosta.myproject.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/*
	  DTO : Data Transfer Object 계층간 데이터 전송 역할  ex) ProductDTO
	  
	  Entity : DB 테이블과 대응되는 모델링 클래스   ex) entity.Product
	           테이블에 없는 필드를 가져서는 안됨 
	
	  Entity 와 DTO로 역할을 분리하는 것이 바람직
	  
	  View <-> Controller : DTO(Data Transfer Object)로 데이터 교환 
	  Service <-->Repository : Entity 를 이용
	  
	  Entity와 DTO를 분리해야 하는 이유
	  -Entity가 변하면 db에 반영되고 다른 로직에 영향을 미침 
	  예를 들면 API 서버와 사용자 시스템 사이에는 약속된 구조화된 데이터가 전송됨 
	  만약 컨트롤러에서 Entity로 서비스를 할 경우 DB 변경 ->  Entity 변경 -> API Response 또한 변경된다 
	  즉  Entity 변경이 되면 명세화된 약속이 변경되는 구조다. 
	   또한 View와 연동하면서 데이터 변경이 필요한 경우가 있으므로 
	   ( Entity 를 변경하면 DB가 바뀔 수 있기 때문에 ) DTO와 Entity로 분리하는 것이 바람직하다
	  
	  ​ ModelMapper : Entity 와 DTO를 자동 Mapping 하는 역할을 함
	   maven pom.xml에 추가 
										
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductDTO {
	private int id;
	private String name;
	private String maker;
	private int price;
}
