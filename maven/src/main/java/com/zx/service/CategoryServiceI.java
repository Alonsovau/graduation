package com.zx.service;

import com.zx.model.Category;
import com.zx.model.Pagination;

public interface CategoryServiceI {
	public boolean save(Category category);
	public Pagination<Category> findByName(String name,int pageNo,int maxResult);
	public Category findByID(int id);
	public boolean update(Category category);
	public boolean delete(Category category);
}
