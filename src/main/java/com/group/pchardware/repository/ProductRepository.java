package com.group.pchardware.repository;

import com.group.pchardware.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Integer> {
    @Override
    @Query(value = "SELECT * FROM products where products.for_sale = true", nativeQuery = true)
    List<Product> findAll();

    Product findById(int id);

    @Query(value = "SELECT * FROM products WHERE products.category_id = ?1 and products.for_sale = true", nativeQuery = true)
    List<Product> findAllByCategory(int categoryId);

    @Query(value = "SELECT * FROM products WHERE MATCH(name, description) AGAINST (?1)", nativeQuery = true)
    List<Product> search(String query);


    @Modifying
    @Query(value = "INSERT INTO products (name, description, article_number, manufacturer_id, for_sale, price, stock, category_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?)", nativeQuery= true)
    void createProduct(String name, String description, String articleNumber, int manufacturerID, boolean forSale, int price, int stock, int categoryId);

    void deleteById(int id);
}
