package org.kosta.myproject.controller;

import java.util.List;
import java.util.NoSuchElementException;

import org.kosta.myproject.dto.EmployeeDTO;
import org.kosta.myproject.entity.Employee;
import org.kosta.myproject.service.EmployeeService;
import org.modelmapper.ModelMapper;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;

@SuppressWarnings({ "unchecked", "rawtypes" })
@RequiredArgsConstructor
@RestController // @Controller + @ResponseBody

public class EmployeeController {
	private final EmployeeService employeeService;
	/* 
	   ModelMapper : DTO <-> Entity 변환을 위한 컴포넌트 
	   org.kosta.myapp.config.JpaModelMapperConfig 에서 @Bean 으로 생성한 ModelMapper bean을 주입받는다 
	*/
	private final ModelMapper modelMapper;
	
	@GetMapping("/employee")
	public EmployeeDTO[] getAllEmployeeList() {		 
		List<Employee> entityList=employeeService.findAllEmployeeList();
		// Entity List를 DTO Array로 변환		
		return modelMapper.map(entityList, EmployeeDTO[].class);
	}
	@GetMapping("/employee/{id}")
	public ResponseEntity findEmployeeById(@PathVariable("id") int id) {
		ResponseEntity responseEntity=null;
		try {
			Employee employeeEntity=employeeService.findEmployeeById(id);			
			EmployeeDTO employeeDTO=modelMapper.map(employeeEntity, EmployeeDTO.class);
			responseEntity=new ResponseEntity(employeeDTO,HttpStatus.OK);
		} catch (NoSuchElementException e) {
			responseEntity=new ResponseEntity(e.getMessage(), HttpStatus.NOT_FOUND);
		}		
		return responseEntity;
	}
}
