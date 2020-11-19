package com.group.pchardware.repository;

import com.group.pchardware.model.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderItemRepository extends JpaRepository<OrderItem, Integer>
{

}
