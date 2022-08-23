package org.kosta.myproject.service;

import java.util.List;

import org.kosta.myproject.entity.Employee;

public interface EmployeeService {
	public List<Employee> findAllEmployeeList();
	public Employee findEmployeeById(int id);
}
