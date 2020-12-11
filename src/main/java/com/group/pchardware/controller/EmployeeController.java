package com.group.pchardware.controller;

import com.group.pchardware.model.Employee;
import com.group.pchardware.repository.EmployeeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/employees")
public class EmployeeController
{
    @Autowired
    private EmployeeRepository employeeRepository;

    @PostMapping("/new")
    public ResponseEntity newEmployee(@RequestBody Employee employee)
    {
        if(employee.getId() != 0)
        {
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity(employeeRepository.save(employee), HttpStatus.OK);
    }

    @PutMapping("/modify")
    public ResponseEntity modifyEmployee(@RequestBody Employee employee)
    {
        if(employeeRepository.findById(employee.getId()) == null)
        {
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity(employeeRepository.save(employee), HttpStatus.OK);
    }

    @PutMapping("/fire/{id}")
    public ResponseEntity fireEmployee(@PathVariable int id)
    {
        Employee e = employeeRepository.findById(id);
        e.setEmployed(false);
        employeeRepository.save(e);
        return new ResponseEntity(HttpStatus.OK);
    }
}
