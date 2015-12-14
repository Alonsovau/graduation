package com.zx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zx.dao.BaseDao;
import com.zx.model.Category;
import com.zx.model.Pagination;
import com.zx.model.Saler;
import com.zx.service.SalerServiceI;

@Service("salerService")
public class SalerServiceImpl implements SalerServiceI{
	private BaseDao<Saler> salerDao;
	@Autowired
	public void setSalerDao(BaseDao<Saler> salerDao) {
		this.salerDao = salerDao;
	}
	@Override
	public boolean save(Saler saler) {
		Object[] queryParams = { saler.getName() };
		Saler result = (Saler) salerDao.uniqueResult(
				"from Saler where name = ?", queryParams);
		if(result==null){
			salerDao.save(saler);
			return true;
		}
		return false;
	}
	@Override
	public Pagination<Saler> findByName(String name, int pageNo, int maxResult) {
		if(name!=null){
			String where="where name like ?";
			Object[] queryParams={"%"+name+"%"};
			return salerDao.find(Saler.class, pageNo, maxResult, where, queryParams);
		}
		return salerDao.find(Saler.class, pageNo, maxResult, null, null);
	}
	@Override
	public Saler findByID(int id) {
		return salerDao.get(id,Saler.class);
	}
	@Override
	public boolean update(Saler saler) {
		Object[] queryParams = { saler.getName() };
		Saler result = (Saler) salerDao.uniqueResult(
				"from Saler where name = ?", queryParams);
		Saler tempSaler=findByID(saler.getSalerId());
		if(saler.getName().equals(tempSaler.getName())){
			return true;
		}else if(result==null){
			salerDao.update(saler);
			return true;
		}
		return false;
	}
	@Override
	public boolean delete(Saler saler) {
		salerDao.delete(Saler.class, saler.getSalerId());
		return true;
	}
	

}
