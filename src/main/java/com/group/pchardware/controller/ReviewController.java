package com.group.pchardware.controller;

import com.group.pchardware.model.Review;
import com.group.pchardware.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {

    @Autowired
    private ReviewRepository reviewRepository;

    @GetMapping("/reviews/formReview")
    public String createReviewForm(Model model) {

        model.addAttribute("review", new Review());
        return "reviews/createReview";

    }

    @PostMapping("/reviews/createReview")
    public String createReview(Review review) {

        reviewRepository.save(review);

        return "redirect:/reviews";
    }

    @PutMapping("/reviews/updateReview/{id}")
    public String updateReview(Model model, @PathVariable(value = "id") int id, @RequestParam int rating, @RequestParam String title, @RequestParam String comment, @RequestParam int customer_id, @RequestParam int product_id) {
        Review r = new Review();
        r.setId(id);
        r.setRating(rating);
        r.setTitle(title);
        r.setComment(comment);
        r.setCustomer_id(customer_id);
        r.setProduct_id(product_id);

        model.addAttribute("reviews", reviewRepository.save(r));
        return "Updated=>Saved";
    }

    @RequestMapping("/reviews/deleteReview/{id}")
    public void deleteById(@PathVariable(value = "id") int id){
        reviewRepository.findById(id);
        reviewRepository.deleteById(id);
    }

    @RequestMapping("/reviews")
    public String getReviews(Model model) {

        model.addAttribute("reviews", reviewRepository.findAll());

        return "reviews/listReviews";
    }

}