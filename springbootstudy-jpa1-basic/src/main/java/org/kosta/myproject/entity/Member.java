package org.kosta.myproject.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
@Entity // jpa가 관리하는 클래스 
@Table(name="JPA_MEMBER") // 테이블명 
public class Member {
	@Column(name = "ID") // db 컬럼명 매핑 
    @Id // Primary key  
	private String id;
	@Column
	private String password;
	@Column
	private String name;
	@Column
	private String address;	
	public void updateInfo(String name,String address) {
		this.name=name;
		this.address=address;
	}
}
