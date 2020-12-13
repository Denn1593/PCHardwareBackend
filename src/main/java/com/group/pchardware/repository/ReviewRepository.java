package com.group.pchardware.repository;

import com.group.pchardware.model.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ReviewRepository extends JpaRepository<Review, Integer> {
    @Override
    @Query(value =
            "SELECT * FROM reviews JOIN products ON products.id = reviews.product_id"
            , nativeQuery = true)
    List<Review> findAll();

    @Modifying
    @Query(value = "INSERT INTO reviews (rating, title, comment, customer_id, product_id) VALUES (?, ?, ?, ?, ?)", nativeQuery= true)
    void createReview(int rating, String title, String comment, int customer_id, int product_id);

    @Modifying
    @Query(value = "UPDATE reviews SET rating = ?, title = ?, comment = ?, customer_id = ?, product_id = ? WHERE id = ?", nativeQuery= true)
    String updateReview(int id, int rating, String title, String comment, int customer_id, int product_id);

    @Modifying
    @Query(value = "DELETE FROM reviews WHERE reviews.id = :id", nativeQuery= true)
    void deleteById(@Param("id") int id);
//    String deleteReviewById(int id);

    void findById(int id);
}
