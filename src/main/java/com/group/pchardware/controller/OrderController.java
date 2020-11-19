package com.group.pchardware.controller;

import com.group.pchardware.model.Order;
import com.group.pchardware.model.OrderItem;
import com.group.pchardware.repository.OrderItemRepository;
import com.group.pchardware.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
    public ResponseEntity<List<Order>> getAllOrders() {
        return new ResponseEntity<>(orderRepository.findAllOrders(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Order> getOrderById(@PathVariable(value = "id") int id)
    {
        return new ResponseEntity<>(orderRepository.findById(id), HttpStatus.OK);
    }

    @GetMapping("/status/{id}")
    public ResponseEntity<String> getOrderStatus(@PathVariable(value = "id") int id)
    {
        return new ResponseEntity<>(orderRepository.status(orderRepository.findById(id).getStatus_id()), HttpStatus.OK);
    }

    @PutMapping("/changeStatus/{id}/{statusID}")
    public ResponseEntity<Integer> putOrderStatus(@PathVariable(value = "id") int id, @PathVariable(value = "statusID") int statusID)
    {
       return new ResponseEntity<>(orderRepository.updateOrderStatus(statusID, id), HttpStatus.OK);
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
