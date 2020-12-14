package com.group.pchardware.controller;

import com.group.pchardware.model.Category;
import com.group.pchardware.model.Product;
import com.group.pchardware.repository.CategoryRepository;
import com.group.pchardware.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class ProductController
{
    @Autowired
    ProductRepository productRepository;

    @Autowired
    CategoryRepository categoryRepository;

    @RequestMapping("/products")
    public String getAllProducts(Model model)
    {
        model.addAttribute("products", productRepository.findAll());

        return "products/listProducts";
    }

    @GetMapping("/products/{id}")
    public ResponseEntity<Product> getProductById(@PathVariable(value = "id") int id)
    {
        return new ResponseEntity<Product>(productRepository.findById(id), HttpStatus.OK);
    }

    @GetMapping("/products/category/{id}")
    public ResponseEntity<List<Product>> getProductsByCategory(@PathVariable(value = "id") int id)
    {
        return new ResponseEntity<List<Product>>(productRepository.findAllByCategory(id), HttpStatus.OK);
    }

    @GetMapping("/productssearch")
    public ResponseEntity<List<Product>> searchForProducts(@RequestParam String query)
    {
        return new ResponseEntity<List<Product>>(productRepository.search(query), HttpStatus.OK);
    }




    @GetMapping("/products/formProduct")
    public String createProductForm(Model model) {

        model.addAttribute("product", new Product());

        return "products/createProduct";

    }

    @PostMapping("/products/createProduct")
    public String createProduct(Product product) {

        productRepository.save(product);

        return "redirect:/products";
    }


    @PutMapping("/products/modify")
    public ResponseEntity modifyEmployee(@RequestBody Product product)
    {
        if(productRepository.findById(product.getId()) == null)
        {
            return new ResponseEntity(HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity(productRepository.save(product), HttpStatus.OK);
    }

    @DeleteMapping("/products/delete/{id}")
    public ResponseEntity deleteProduct(@PathVariable(value = "id") int id)
    {
        Product product = productRepository.findById(id);
        product.setForSale(false);
        productRepository.save(product);
        return new ResponseEntity(HttpStatus.OK);
    }

    @PostMapping("/category/new")
    public ResponseEntity addCategory(@RequestBody Category category)
    {
        categoryRepository.save(category);

        return new ResponseEntity(HttpStatus.OK);
    }
}
