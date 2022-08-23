package org.kosta.myproject.dto;

import lombok.Data;

@Data
public class EmployeeDTO {
	private int id;
	private String ename;
	private  DepartmentDTO department;
	
}
