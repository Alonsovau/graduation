package com.zx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zx.dao.BaseDao;
import com.zx.model.Category;
import com.zx.model.Pagination;
import com.zx.model.Product;
import com.zx.service.ProductServiceI;

@Service("productService")
public class ProductServiceImpl implements ProductServiceI{

	private BaseDao<Product> productDao;
	@Autowired
	public void setProductDao(BaseDao<Product> productDao) {
		this.productDao = productDao;
	}

	@Override
	public boolean save(Product product) {
			productDao.save(product);
			return true;
	}

	/*
	 * if(name!=null){
				String where="where name like ?";
				Object[] queryParams={"%"+name+"%"};
				return categoryDao.find(Category.class, pageNo, maxResult, where, queryParams);
			}
			return categoryDao.find(Category.class, pageNo, maxResult, null, null);
	 * */
	@Override
	public Pagination<Product> find(Integer categoryId, String salerName,
			String productName, int pageNo, int maxResult) {
		String where=" ";
		
		return null;
	}

}
