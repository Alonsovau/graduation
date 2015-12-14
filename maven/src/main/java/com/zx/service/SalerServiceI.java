package com.zx.service;

import com.zx.model.Pagination;
import com.zx.model.Saler;

public interface SalerServiceI {
	public boolean save(Saler saler);
	public Pagination<Saler> findByName(String name,int pageNo,int maxResult);
	public Saler findByID(int id);
	public boolean update(Saler saler);
	public boolean delete(Saler saler);
}
