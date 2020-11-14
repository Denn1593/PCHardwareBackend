package com.group.pchardware.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "order")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    private Date date;
    private int customer_id;
    private int employee_id;
    private int status_id;
    private int orderAudit_id;
    private int paymentMethod_id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public int getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(int employee_id) {
        this.employee_id = employee_id;
    }

    public int getStatus_id() {
        return status_id;
    }

    public void setStatus_id(int status_id) {
        this.status_id = status_id;
    }

    public int getOrderAudit_id() {
        return orderAudit_id;
    }

    public void setOrderAudit_id(int orderAudit_id) {
        this.orderAudit_id = orderAudit_id;
    }

    public int getPaymentMethod_id() {
        return paymentMethod_id;
    }

    public void setPaymentMethod_id(int paymentMethod_id) {
        this.paymentMethod_id = paymentMethod_id;
    }
}
