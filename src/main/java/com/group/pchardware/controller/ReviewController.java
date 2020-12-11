package com.group.pchardware.controller;

import com.group.pchardware.model.Review;
import com.group.pchardware.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/reviews")
public class ReviewController {

    @Autowired
    private ReviewRepository reviewRepository;

    @PostMapping("/createReview")
    public @ResponseBody String createReview(@RequestParam int rating, @RequestParam String title, @RequestParam String comment, @RequestParam int customer_id, @RequestParam int product_id) {
        Review r = new Review();
        r.setRating(rating);
        r.setTitle(title);
        r.setComment(comment);
        r.setCustomer_id(customer_id);
        r.setProduct_id(product_id);
        reviewRepository.save(r);
        return "Saved";
    }

    @PutMapping("/updateReview/{id}")
    public String updateReview(@PathVariable(value = "id") int id, @RequestParam int rating, @RequestParam String title, @RequestParam String comment, @RequestParam int customer_id, @RequestParam int product_id) {
        Review r = new Review();
        r.setId(id);
        r.setRating(rating);
        r.setTitle(title);
        r.setComment(comment);
        r.setCustomer_id(customer_id);
        r.setProduct_id(product_id);
        reviewRepository.save(r);
        return "Updated=>Saved";
    }

    @GetMapping(path = "/all")
    public @ResponseBody List<Review> getAllReviews() {
        return reviewRepository.findAllReviews();
    }


}