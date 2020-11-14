package com.group.pchardware.repository;

import com.group.pchardware.model.Order;
import com.group.pchardware.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderRepository  extends JpaRepository<Product, Integer> {

    @Query(value = "SELECT * FROM order", nativeQuery = true)
    List<Order> findAllOrders();

    Order findById(int id);

    @Query(value = "SELECT name FROM status WHERE status.id = ?", nativeQuery = true)
    String status(Integer id);

    @Modifying
    @Query(value = "UPDATE order SET statusID = ? WHERE id = ? ", nativeQuery= true)
    int updateOrderStatus(Integer statusID, Integer orderID);
}
