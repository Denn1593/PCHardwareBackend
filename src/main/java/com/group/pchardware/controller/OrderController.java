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
        return orderRepository.status(orderRepository.findById(id).getStatusId());
    }

    @PutMapping("/changestatus/{id}/{statusid}")
    public Integer putOrderStatus(@PathVariable(value = "id") int id, @PathVariable(value = "statusid") int statusId)
    {
       return orderRepository.updateOrderStatus(statusId, id);
    }

    @PostMapping("/place")
    public Integer placeOrder(@RequestBody Order order)
    {
        String idList = "";
        String quantityList = "";

        for (int i = 0; i < order.getOrderItems().size(); i++)
        {
            idList += "" + order.getOrderItems().get(i).getProduct().getId();
            quantityList += "" + order.getOrderItems().get(i).getProduct().getId();

            if(i < order.getOrderItems().size())
            {
                idList += ",";
                quantityList += ",";
            }
        }

        System.out.println(order);

        orderRepository.create_order(order.getCustomerId(), order.getPaymentMethodId(), order.getEmployeeId(), idList, quantityList);

        return 1;
    }
}
