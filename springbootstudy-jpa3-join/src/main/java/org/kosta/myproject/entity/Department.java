package org.kosta.myproject.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@ToString
@Entity
@SequenceGenerator(name="jpa_department_seq_generator",sequenceName = "jpa_department_seq",initialValue = 1,allocationSize = 1)
@Table(name="jpa_department")
public class Department {
	@Id // 기본키 
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "jpa_department_seq_generator")
	@Column(name = "department_id") // db 컬럼명 매핑 
    private int departmentId;
	private String dname;
	private String location;
}
