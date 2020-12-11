package com.group.pchardware.repository;

import com.group.pchardware.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepository extends JpaRepository<Category, Integer>
{
}
