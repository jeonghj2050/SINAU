package com.sinau.dao;

import java.util.List;

import com.sinau.dto.CategoryDto;

public interface CategoryDao {
	//카테고리를 가져오는 메소드
	List<CategoryDto> getCategories();

}
