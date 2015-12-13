package com.zx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zx.dao.BaseDao;
import com.zx.model.Category;
import com.zx.model.Pagination;
import com.zx.service.CategoryServiceI;
@Service("categoryService")
public class CategoryServiceImpl implements CategoryServiceI{
		private BaseDao<Category> categoryDao;
		@Autowired
		public void setCategoryDao(BaseDao<Category> categoryDao) {
			this.categoryDao = categoryDao;
		}
		
		public boolean save(Category category){
			Object[] queryParams = { category.getName() };// 设置参数对象数组
			Category result = (Category) categoryDao.uniqueResult(
					"from Category where name = ?", queryParams);
			if(result==null){
				categoryDao.save(category);
				return true;
			}
			return false;
		}

		@Override
		public Pagination<Category> findByName(String name, int pageNo,
				int maxResult) {
			if(name!=null){
				String where="where name like ?";
				Object[] queryParams={"%"+name+"%"};
				return categoryDao.find(Category.class, pageNo, maxResult, where, queryParams);
			}
			return categoryDao.find(Category.class, pageNo, maxResult, null, null);
		}

		@Override
		public Category findByID(int id) {
			return categoryDao.get(id, Category.class);
		}

		@Override
		public boolean update(Category category) {
			Object[] queryParams = { category.getName() };
			Category result = (Category) categoryDao.uniqueResult(
					"from Category where name = ?", queryParams);
			Category tempCategory=findByID(category.getCateId());
			if(category.getName().equals(tempCategory.getName())){
				return true;
			}else if(result==null){
				categoryDao.update(category);
				return true;
			}
			return false;
		}

		@Override
		public boolean delete(Category category) {
//			Category tempCategory=findByID(category.getCateId());
//			if(tempCategory==null)
//				return false;
//			category.setCateId(Integer.valueOf(category.getCateId()));
//			category.setName(tempCategory.getName());
			categoryDao.delete(Category.class, category.getCateId());
			return true;
		}
		
}
