package com.group.pchardware.model;

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
    private String manufacturer;
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

    public String getManufacturer()
    {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer)
    {
        this.manufacturer = manufacturer;
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
