package com.group.pchardware.controller;

import com.group.pchardware.model.Customer;
import com.group.pchardware.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("customers")
public class CustomerController {

    @Autowired
    private CustomerRepository customerRepository;

    @PostMapping("/new")
    public Integer newCustomer(@RequestBody Customer customer) {
        return customerRepository.newCustomer(
                customer.getFirstName(),
                customer.getLastName(),
                customer.getAddress(),
                customer.getPhone(),
                customer.getEmail(),
                customer.getZip(),
                customer.getCountry()
        );
    }

    @PutMapping("/updatefirstname/{id}/{firstname}")
    public Integer updateFirstName(@PathVariable(value = "id") int id, @PathVariable(value = "firstname") String firstName) {
        return customerRepository.updateFirstName(firstName, id);
    }

    @PutMapping("/updatelastname/{id}/{lastname}")
    public Integer updateLastName(@PathVariable(value = "id") int id, @PathVariable(value = "lastname") String lastName) {
        return customerRepository.updateLastName(lastName, id);
    }

    @PutMapping("/updateaddress/{id}/{address}")
    public Integer updateAddress(@PathVariable(value = "id") int id, @PathVariable(value = "address") String address) {
        return customerRepository.updateAddress(address, id);
    }

    @PutMapping("/updatephone/{id}/{phone}")
    public Integer updatePhone(@PathVariable(value = "id") int id, @PathVariable(value = "phone") String phone) {
        return customerRepository.updatePhone(phone, id);
    }

    @PutMapping("/updateemail/{id}/{email}")
    public Integer updateEmail(@PathVariable(value = "id") int id, @PathVariable(value = "email") String email) {
        return customerRepository.updateEmail(email, id);
    }

    @PutMapping("/updatecountry/{id}/{country}")
    public Integer updateCountry(@PathVariable(value = "id") int id, @PathVariable(value = "country") String country) {
        return customerRepository.updateCountry(country, id);
    }
}
