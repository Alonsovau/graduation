package com.zx.service.impl;

import org.apache.log4j.Logger;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zx.dao.BaseDao;
import com.zx.model.Customer;
import com.zx.service.CustomerServiceI;

@Service("customerService")
//@Transactional
public class CustomerServiceImpl implements CustomerServiceI {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger
			.getLogger(CustomerServiceImpl.class);
	private BaseDao<Customer> customerDao;
	
	public BaseDao<Customer> getCustomerDao() {
		return customerDao;
	}
	@Autowired
	public void setCustomerDao(BaseDao<Customer> customerDao) {
		this.customerDao = customerDao;
	}

	public Customer login(String username, String password) {
		if (username != null && password != null) {
			String where = "where username=? and password=?";
			Object[] queryParams = { username, password };
			List<Customer> list = customerDao.find(Customer.class,-1, -1, where, queryParams).getList();
			if (list != null && list.size() > 0) {
				return list.get(0);
			}
		}
		return null;
	}

	public boolean isUnique(String username) {
		Object[] queryParams = { username };// 设置参数对象数组
		Customer result = (Customer)customerDao.uniqueResult(
				"from Customer where username = ?", queryParams);
		// List list =
		// super.getSession().find("from Customer where username = ?",
		// username);
		if(result==null)
			return true;
		return false;
	}
	@Override
	public void save(Customer customer) {
		customerDao.save(customer);
	}

}
