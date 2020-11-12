package com.group.pchardware.controller;

import com.group.pchardware.model.Product;
import com.group.pchardware.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/products")
public class ProductController
{
    @Autowired
    ProductRepository productRepository;

    @GetMapping("/all")
    public ResponseEntity<List<Product>> getAllProducts()
    {
        return new ResponseEntity<List<Product>>(productRepository.findAllProducts(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Product> getProductById(@PathVariable(value = "id") int id)
    {
        return new ResponseEntity<Product>(productRepository.findById(id), HttpStatus.OK);
    }

    @GetMapping("/category/{id}")
    public ResponseEntity<List<Product>> getProductsByCategory(@PathVariable(value = "id") int id)
    {
        return new ResponseEntity<List<Product>>(productRepository.findAllByCategory(), HttpStatus.OK);
    }

    @GetMapping("/search")
    public ResponseEntity<List<Product>> searchForProducts(@RequestParam String query)
    {
        return new ResponseEntity<List<Product>>(productRepository.search(), HttpStatus.OK);
    }
}
