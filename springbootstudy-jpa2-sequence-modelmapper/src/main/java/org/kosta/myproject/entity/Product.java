package org.kosta.myproject.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
@Entity // jpa가 관리하는 클래스
//오라클 시퀀스 설정 
@SequenceGenerator(name="jpa_product_seq_generator",sequenceName = "jpa_product_seq",initialValue = 1,allocationSize = 1)
@Table(name="jpa_product") // 테이블명 product 
@NoArgsConstructor
@Getter
@ToString
public class Product {
	@Id // 기본키 
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "jpa_product_seq_generator")
	@Column(name = "ID") // db 컬럼명 매핑 
    private int id;
	private String name;
	private String maker;
	private int price;
	@Builder
	public Product(String name, String maker, int price) {
		super();
		this.name = name;
		this.maker = maker;
		this.price = price;
	}	
	public void updateInfo(String name,String maker,int price) {
		this.name = name;
		this.maker = maker;
		this.price = price;
	}
}
