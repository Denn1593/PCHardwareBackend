package com.group.pchardware.model;

import javax.persistence.*;

@Entity
@Table(name = "order_items")
public class OrderItem
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private int unitprice;

    @Column(name = "product_id")
    private int productId;

    @Column(name = "order_id")
    private int orderId;

    @ManyToOne
    @JoinColumn(name = "product_id", insertable = false, updatable = false)
    private Product product;

    public int getOrderId()
    {
        return orderId;
    }

    public void setOrderId(int orderId)
    {
        this.orderId = orderId;
    }

    public int getProductId()
    {
        return productId;
    }

    public void setProductId(int productId)
    {
        this.productId = productId;
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
