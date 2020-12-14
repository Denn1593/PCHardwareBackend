package com.group.pchardware.repository;

import com.group.pchardware.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {
    @Override
    @Query(value = "SELECT * FROM products", nativeQuery = true)
    List<Product> findAll();

    Product findById(int id);
    
    @Query(value = "SELECT * FROM products WHERE products.category_id = ?1", nativeQuery = true)
    List<Product> findAllByCategory(int categoryId);

    @Query(value = "SELECT * FROM products WHERE MATCH(name, description) AGAINST (?1)", nativeQuery = true)
    List<Product> search(String query);


    @Modifying
    @Query(value = "INSERT INTO products (name, description, article_number, manufacturer, for_sale, price, stock, category_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", nativeQuery= true)
    void createReview(String name, String description, String article_number, String manufacturer, boolean for_sale, int price, int stock, int category_id);

    void deleteById(int id);
}
