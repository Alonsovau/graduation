package com.zx.service;

import com.zx.model.Customer;


public interface CustomerServiceI{
	public Customer login(String username,String password);
	public boolean isUnique(String username);
	public void save(Customer customer);
	public void update(Customer customer);
}
