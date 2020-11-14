package com.group.pchardware.controller;

import com.group.pchardware.model.Order;
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

    @GetMapping("/all")
    public ResponseEntity<List<Order>> getAllOrders() {
        try {
            return new ResponseEntity<>(orderRepository.findAllOrders(), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<Order> getOrderById(@PathVariable(value = "id") int id)
    {
        try {
            return new ResponseEntity<>(orderRepository.findById(id), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/status/{id}")
    public ResponseEntity<String> getOrderStatus(@PathVariable(value = "id") int id)
    {
        try {
            return new ResponseEntity<>(orderRepository.status(orderRepository.findById(id).getStatus_id()), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    @PutMapping("/changeStatus/{id}/{statusID}")
    public ResponseEntity<Integer> putOrderStatus(@PathVariable(value = "id") int id, @PathVariable(value = "statusID") int statusID)
    {
        try {
            return new ResponseEntity<>(orderRepository.updateOrderStatus(statusID, id), HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

    }



}
