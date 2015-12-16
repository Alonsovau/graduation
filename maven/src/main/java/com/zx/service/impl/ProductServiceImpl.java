package com.zx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zx.dao.BaseDao;
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

}
