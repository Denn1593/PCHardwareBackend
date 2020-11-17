package com.group.pchardware.repository;

import com.group.pchardware.model.Order;
import com.group.pchardware.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderRepository  extends JpaRepository<Product, Integer> {
    // Remake after changing the naming convention
    @Query(value =
            "SELECT orders.id, orders.date, products.name, order_items.amount, order_items.unitprice, status.name" +
            "FROM orders " +
            "JOIN order_items ON orders.id = order_items.OrderID " +
            "JOIN products ON products.orderItemID = order_items.id" + // not sure I agree on this, why not have a foreign key in the order_items for the product equal to their id
            "JOIN status ON orders.statusID = status.id"
            , nativeQuery = true)
    List<Order> findAllOrders();

    Order findById(int id);

    @Query(value = "SELECT name FROM status WHERE status.id = ?", nativeQuery = true)
    String status(Integer id);

    @Modifying
    @Query(value = "UPDATE orders SET statusID = ? WHERE id = ? ", nativeQuery= true)
    int updateOrderStatus(Integer statusID, Integer orderID);
}
