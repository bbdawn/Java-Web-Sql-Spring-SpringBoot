package org.kosta.myproject.service;

import java.util.List;

import org.kosta.myproject.entity.Employee;
import org.kosta.myproject.repository.EmployeeRepository;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Service
public class EmployeeServiceImpl implements EmployeeService {
	private final EmployeeRepository employeeRepository;

	@Override
	public List<Employee> findAllEmployeeList() {
		return employeeRepository.findAllByOrderByIdDesc();
	}

	@Override
	public Employee findEmployeeById(int id) {
		return employeeRepository.findById(id).get();
	}
}
