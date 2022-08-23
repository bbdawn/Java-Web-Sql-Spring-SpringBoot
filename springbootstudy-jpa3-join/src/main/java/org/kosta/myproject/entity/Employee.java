package org.kosta.myproject.entity;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Entity // jpa가 관리하는 클래스
//오라클 시퀀스 설정 
@SequenceGenerator(name="jpa_employee_seq_generator",sequenceName = "jpa_employee_seq",initialValue = 1,allocationSize = 1)
@Table(name="jpa_employee") // 테이블명 employee 
public class Employee {
	@Id // 기본키 
	@GeneratedValue(strategy = GenerationType.SEQUENCE,generator = "jpa_employee_seq_generator")
	@Column(name = "id") // db 컬럼명 매핑 
    private int id;

    @Column(name = "ename")
    private String ename;

    @ManyToOne(optional = false) // 다 대 일 관계 ( false 는 inner join , true 는 left outer join ) 
    @JoinColumn(name = "department_id") // 외래키
    private  Department department;

    
}
