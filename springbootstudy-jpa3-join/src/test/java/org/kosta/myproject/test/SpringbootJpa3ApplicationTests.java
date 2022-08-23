package org.kosta.myproject.test;

import javax.annotation.Resource;

import org.junit.jupiter.api.Test;
import org.kosta.myproject.entity.Department;
import org.kosta.myproject.entity.Employee;
import org.kosta.myproject.repository.DepartmentRepository;
import org.kosta.myproject.repository.EmployeeRepository;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
class SpringbootJpa3ApplicationTests {
	@Resource
	EmployeeRepository employeeRepository;
	@Resource
	DepartmentRepository departmentRepository;
	@Test
	void employeeAndDepartmentInsert() {		
		//부서등록 : 부서아이디 ( sequence ) 는 자동생성되는 지 확인
		//사원 등록 -> 사원 		
		
		log.info("부서등록:{}",departmentRepository.save(Department.builder().dname("연구개발").location("오리").build()));	
	    log.info("부서등록:{}",departmentRepository.save(Department.builder().dname("기술영업").location("강남").build()));
			
		log.info("사원등록:{}",employeeRepository.save(Employee.builder().ename("아이유").department(Department.builder().departmentId(1).build()).build()));
		log.info("사원등록:{}",employeeRepository.save(Employee.builder().ename("이택조").department(Department.builder().departmentId(1).build()).build()));
	
	
	}	
	@Test
	void employeeAndDepartmentCount() {
		//사원수 조회 
	    log.info("사원수  {}",employeeRepository.count());
	    //부서수 조회
	    log.info("부서수 {}",departmentRepository.count());	  	  
	}
	@Test
	void findEmployeeJoinDepartment() {
		 //개별 사원 조회 : join 결과를 확인해본다( Employee has a Department )
		log.info("사원정보조회(join) {}",employeeRepository.findById(1).get());		
	}
}










