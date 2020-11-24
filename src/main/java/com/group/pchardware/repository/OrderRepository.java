package com.group.pchardware.repository;

import com.group.pchardware.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderRepository  extends JpaRepository<Order, Integer> {
    @Query(value =
            "SELECT * FROM orders JOIN order_items ON orders.id = order_items.order_id JOIN products ON products.id = order_items.product_id JOIN status ON orders.status_id = status.id"
            , nativeQuery = true)
    List<Order> findAllOrders();

    Order findById(int id);

    @Query(value = "SELECT name FROM status WHERE status.id = ?", nativeQuery = true)
    String status(Integer id);

    @Modifying
    @Query(value = "UPDATE orders SET statusID = ? WHERE id = ? ", nativeQuery= true)
    int updateOrderStatus(Integer statusID, Integer orderID);
}
