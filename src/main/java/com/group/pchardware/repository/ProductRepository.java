package com.group.pchardware.repository;

import com.group.pchardware.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.http.HttpStatus;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer>
{
    @Query(value = "select * from product", nativeQuery = true)
    public List<Product> findAllProducts();

    public Product findById(int id);

    @Query(value = "select * from product where product.category_id = 1", nativeQuery = true)
    public List<Product> findAllByCategory();

    @Query(value = "select * from product where match(name, description) against('1080p')", nativeQuery = true)
    public List<Product> search();
}
