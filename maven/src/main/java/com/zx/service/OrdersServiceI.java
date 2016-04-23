package com.zx.service;

import java.sql.Timestamp;

import com.zx.model.Orders;
import com.zx.model.Pagination;

public interface OrdersServiceI {
	public boolean add(Orders order);
	public Pagination<Orders> find(String username, Integer cus_id,
			Timestamp start, Timestamp end, int pageNo, int maxResult);
	public Orders findByID(int id);
	public Pagination<Orders> findBycusID(int id,int pageNo, int maxResult);
	public boolean update(Orders orders);
}
