package com.group.pchardware.repository;

import com.group.pchardware.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {
    @Modifying
    @Query(value = "INSERT INTO customers VALUES (?, ?, ?, ?, ?, ?, ?)", nativeQuery = true)
    int newCustomer(String firstName, String lastName, String address, String phone, String email, Integer zip, String country);

    @Modifying
    @Query(value = "UPDATE customers SET first_name = ? WHERE id = ?", nativeQuery = true)
    int updateFirstName(String firstName, Integer id);

    @Modifying
    @Query(value = "UPDATE customers SET last_name = ? WHERE id = ?", nativeQuery = true)
    int updateLastName(String lastName, Integer id);

    @Modifying
    @Query(value = "UPDATE customers SET address = ? WHERE id = ?", nativeQuery = true)
    int updateAddress(String address, Integer id);

    @Modifying
    @Query(value = "UPDATE customers SET phone = ? WHERE id = ?", nativeQuery = true)
    int updatePhone(String phone, Integer id);

    @Modifying
    @Query(value = "UPDATE customers SET email = ? WHERE id = ?", nativeQuery = true)
    int updateEmail(String email, Integer id);

    @Modifying
    @Query(value = "UPDATE customers SET country = ? WHERE id = ?", nativeQuery = true)
    int updateCountry(String country, Integer id);


}
