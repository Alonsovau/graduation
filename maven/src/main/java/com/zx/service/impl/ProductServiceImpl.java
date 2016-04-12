package com.zx.service.impl;

import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zx.dao.BaseDao;
import com.zx.model.Category;
import com.zx.model.Pagination;
import com.zx.model.Picture;
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
		Object[] queryParams=new Object[3];
		queryParams[0]=categoryId;
		StringBuffer where=new StringBuffer().append(" from product p,saler s where cate_id=? ");
		if(productName!=null&&productName.length()>0){
			where.append(" and p.name like ? ");
			queryParams[1]="%"+productName+"%";
		}
		if(salerName!=null&&salerName.length()>0){
			where.append(" and s.name like ? ");
			queryParams[2]="%"+salerName+"%";
		}
		where.append(" and p.saler_id=s.saler_id ");
		List<Object> list=productDao.listResult("select product_id,p.name "+where.toString(), queryParams, pageNo, maxResult);
		List<Product> products = new LinkedList<Product>();
		Pagination<Product> pagination=new Pagination<Product>();
		for(int i=0;i<list.size();i++){
			Product p=new Product();
			Object[] o=(Object[]) list.get(i);
			p.setProductId((Integer) o[0]);
			p.setName(o[1].toString());
			products.add(p);
		}
		int totalRecords= ((BigInteger)productDao.uniqueResultSQL("select count(*) "+where.toString(), queryParams)).intValue();
		pagination.setList(products);
		pagination.setPageNo(pageNo);
		pagination.setPageSize(maxResult);
		pagination.setTotalRecords(totalRecords);
		return pagination;
	}

	@Override
	public Product findByID(int id) {
		return productDao.get(id, Product.class);
	}

	@Override
	public boolean delete(Product product) throws IOException {
		Properties properties=new Properties();
		properties.load(getClass().getResourceAsStream("/config.properties"));
		String path=properties.get("uploadDirectory").toString();
		int begin=path.indexOf("UploadImage");
		product=findByID(product.getProductId());
		Iterator<Picture> it=product.getPictures().iterator();
		while(it.hasNext()){
			Picture picture=(Picture) it.next();
			String realPath=path+picture.getPath().substring(begin+1);
			File file=new File(realPath);
			if(file.exists())
				file.delete();
		}
		productDao.delete(Product.class, product.getProductId());
		return true;
	}

	@Override
	public boolean update(Product product) {
		productDao.update(product);
		return true;
	}

}
