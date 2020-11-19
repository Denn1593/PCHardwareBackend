package com.group.pchardware.model;

import javax.persistence.*;

@Entity
@Table(name = "order_item")
public class OrderItem
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private int unitprice;
    private int product_id;

    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;

    @ManyToOne
    @JoinColumn(name = "product_id", insertable = false, updatable = false)
    private Product product;

    public Order getOrder()
    {
        return order;
    }

    public void setOrder(Order order)
    {
        this.order = order;
    }

    public int getProduct_id()
    {
        return product_id;
    }

    public void setProduct_id(int product_id)
    {
        this.product_id = product_id;
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public int getUnitprice()
    {
        return unitprice;
    }

    public void setUnitprice(int unitprice)
    {
        this.unitprice = unitprice;
    }

    public Product getProduct()
    {
        return product;
    }

    public void setProduct(Product product)
    {
        this.product = product;
    }
}
