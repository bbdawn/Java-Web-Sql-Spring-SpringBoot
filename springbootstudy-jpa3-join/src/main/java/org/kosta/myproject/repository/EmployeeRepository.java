package org.kosta.myproject.repository;

import java.util.List;

import org.kosta.myproject.entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;


@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Integer>{
	List<Employee> findAllByOrderByIdDesc();
	// JPQL 로 Outer Join 처리 : table이 아니라 Entity class 명 및 instance variable 명을 기재 ( 대소문자 엄격히 지킨다 ) 
	// 별칭은 필수 as 는 생략가능 
	// Outer Join 시 사원정보없이 부서정보만 존재할 수 있으므로 Generic 타입을 Object Array로 명시해 사원과 부서정보가 각각 저장되게 한다
	 @Query("select e,d from Employee e RIGHT OUTER JOIN e.department d")
	    List<Object[]> findEmployeeOuterJoin();
}
