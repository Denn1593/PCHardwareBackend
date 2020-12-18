package com.group.pchardware.repository;

import com.group.pchardware.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {
    @Transactional
    @Modifying
    @Query(value = "INSERT INTO customers (first_name, last_name, address, phone, email, zip, country) VALUES (?, ?, ?, ?, ?, ?, ?)", nativeQuery = true)
    int newCustomer(String firstName, String lastName, String address, String phone, String email, Integer zip, String country);

    @Transactional
    @Modifying
    @Query(value = "UPDATE customers SET first_name = ? WHERE id = ?", nativeQuery = true)
    int updateFirstName(String firstName, Integer id);

    @Transactional
    @Modifying
    @Query(value = "UPDATE customers SET last_name = ? WHERE id = ?", nativeQuery = true)
    int updateLastName(String lastName, Integer id);

    @Transactional
    @Modifying
    @Query(value = "UPDATE customers SET address = ? WHERE id = ?", nativeQuery = true)
    int updateAddress(String address, Integer id);

    @Transactional
    @Modifying
    @Query(value = "UPDATE customers SET phone = ? WHERE id = ?", nativeQuery = true)
    int updatePhone(String phone, Integer id);

    @Transactional
    @Modifying
    @Query(value = "UPDATE customers SET email = ? WHERE id = ?", nativeQuery = true)
    int updateEmail(String email, Integer id);

    @Transactional
    @Modifying
    @Query(value = "UPDATE customers SET country = ? WHERE id = ?", nativeQuery = true)
    int updateCountry(String country, Integer id);


}
