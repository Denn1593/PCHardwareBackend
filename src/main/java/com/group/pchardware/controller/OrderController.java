package com.group.pchardware.controller;

import com.group.pchardware.model.Order;
import com.group.pchardware.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/orders")
public class OrderController {

    @Autowired
    OrderRepository orderRepository;

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

    @PutMapping("/changeStatus/{id}/{statusID}")
    public Integer putOrderStatus(@PathVariable(value = "id") int id, @PathVariable(value = "statusID") int statusID)
    {
       return orderRepository.updateOrderStatus(statusID, id);
    }

}
