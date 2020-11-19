package com.group.pchardware.repository;

import com.group.pchardware.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmployeeRepository extends JpaRepository<Employee, Integer>
{
    public Employee findById(int id);
}
