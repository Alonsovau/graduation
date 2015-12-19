package com.zx.service;

import com.zx.model.Pagination;
import com.zx.model.Product;

public interface ProductServiceI {
	public boolean save(Product product);
	public Pagination<Product> find(Integer categoryId,String salerName,String productName,int pageNo,int maxResult);
	public Product findByID(int id);
	public boolean delete(Product product);
	public boolean update(Product product);
}
