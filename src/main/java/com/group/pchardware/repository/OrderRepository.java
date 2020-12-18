package com.group.pchardware.repository;

import com.group.pchardware.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;

public interface OrderRepository  extends JpaRepository<Order, Integer> {
    @Query(value =
            "SELECT * FROM orders JOIN order_items ON orders.id = order_items.order_id JOIN products ON products.id = order_items.product_id JOIN status ON orders.status_id = status.id join manufacturers on manufacturer_id = manufacturers.id"
            , nativeQuery = true)
    List<Order> findAllOrders();

    Order findById(int id);

    @Query(value = "SELECT name FROM status WHERE status.id = ?", nativeQuery = true)
    String status(Integer id);

    @Transactional
    @Modifying
    @Query(value = "UPDATE orders SET status_id = ? WHERE id = ? ", nativeQuery= true)
    int updateOrderStatus(Integer statusID, Integer orderID);

    @Query(value = "call create_order(?, ?, ?, ?, ?)", nativeQuery = true)
    String create_order(int customerId, int paymentMethod, int employeeId, String productIdList, String productQuantityList);
}
