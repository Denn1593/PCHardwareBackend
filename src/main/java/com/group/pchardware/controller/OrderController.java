package com.group.pchardware.controller;

import com.group.pchardware.model.Order;
import com.group.pchardware.repository.OrderItemRepository;
import com.group.pchardware.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    OrderRepository orderRepository;

    @Autowired
    OrderItemRepository orderItemRepository;

    @GetMapping("/all")
    public List<Order> getAllOrders() {
        return orderRepository.findAllOrders();
    }

    @GetMapping("/{id}")
    public Order getOrderById(@PathVariable(value = "id") int id)
    {
        return orderRepository.findById(id);
    }

    @GetMapping("/status/{id}")
    public String getOrderStatus(@PathVariable(value = "id") int id)
    {
        return orderRepository.status(orderRepository.findById(id).getStatus_id());
    }

    @PutMapping("/changestatus/{id}/{statusid}")
    public Integer putOrderStatus(@PathVariable(value = "id") int id, @PathVariable(value = "statusid") int statusId)
    {
       return orderRepository.updateOrderStatus(statusId, id);
    }

    @PostMapping("/place")
    public Order placeOrder(@RequestBody Order order)
    {
        orderRepository.save(order);

        for (int i = 0; i < order.getOrderItems().size(); i++)
        {
            orderItemRepository.save(order.getOrderItems().get(i));
        }

        return order;
    }
}
