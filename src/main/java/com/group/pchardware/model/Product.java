package com.group.pchardware.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;

@Entity
@Table(name = "products")
public class Product
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private String description;
    @Column(name = "article_number")
    private String articleNumber;

    @JsonIgnore
    @Column(name = "manufacturer_id")
    private int manufacturerId;

    @ManyToOne
    @JoinColumn(name = "manufacturer_id", insertable = false, updatable = false)
    private Manufacturer manufacturer;
    @Column(name = "for_sale")
    private boolean forSale;
    private int price;
    private int stock;
    @Column(name = "category_id")
    private int categoryId;

    public boolean isForSale()
    {
        return forSale;
    }

    public void setForSale(boolean forSale)
    {
        this.forSale = forSale;
    }

    public String getArticleNumber()
    {
        return articleNumber;
    }

    public void setArticleNumber(String articleNumber)
    {
        this.articleNumber = articleNumber;
    }

    public void setManufacturer(Manufacturer manufacturer)
    {
        this.manufacturer = manufacturer;
    }

    public int getManufacturerId()
    {
        return manufacturerId;
    }

    public void setManufacturerId(int manufacturerId)
    {
        this.manufacturerId = manufacturerId;
    }

    public Manufacturer getManufacturer()
    {
        return manufacturer;
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getDescription()
    {
        return description;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }

    public int getPrice()
    {
        return price;
    }

    public void setPrice(int price)
    {
        this.price = price;
    }

    public int getStock()
    {
        return stock;
    }

    public void setStock(int stock)
    {
        this.stock = stock;
    }

    public int getCategoryId()
    {
        return categoryId;
    }

    public void setCategoryId(int categoryId)
    {
        this.categoryId = categoryId;
    }
}
