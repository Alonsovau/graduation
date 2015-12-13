package com.zx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zx.dao.BaseDao;
import com.zx.model.Admin;
import com.zx.service.AdminServiceI;

@Service("adminService")
public class AdminServiceImpl implements AdminServiceI{

	private BaseDao<Admin> adminDao;
	
	@Autowired
	public void setAdminDao(BaseDao<Admin> adminDao) {
		this.adminDao = adminDao;
	}

	@Override
	public Admin login(String username, String password) {
		if (username != null && password != null) {
			String where = "where username=? and password=?";
			Object[] queryParams = { username, password };
			List<Admin> list = adminDao.find(Admin.class,-1, -1, where, queryParams).getList();
			if (list != null && list.size() > 0) {
				return list.get(0);
			}
		}
		return null;
	}

}
