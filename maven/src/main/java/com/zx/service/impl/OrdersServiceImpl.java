package com.zx.service.impl;

import java.math.BigInteger;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zx.dao.BaseDao;
import com.zx.model.Orders;
import com.zx.model.Pagination;
import com.zx.service.OrdersServiceI;

@Service("ordersService")
public class OrdersServiceImpl implements OrdersServiceI {

	private BaseDao<Orders> ordersDao;
	
	public BaseDao<Orders> getOrdersDao() {
		return ordersDao;
	}
	@Autowired
	public void setOrdersDao(BaseDao<Orders> ordersDao) {
		this.ordersDao = ordersDao;
	}

	@Override
	public boolean add(Orders order) {
		if(order!=null){
			ordersDao.save(order);
			return true;
		}
		return false;
	}
	@Override
	public Pagination<Orders> find(String username, Integer cus_id,
			Timestamp start, Timestamp end, int pageNo, int maxResult) {
		Object[] queryParams=new Object[4];
		StringBuffer where=new StringBuffer().append(" from customer c,orders o ");
		if(username!=null&&username.length()>0){
			where.append(" where username=? ");
			queryParams[0]=username;
		}
		if(cus_id!=null){
			if(where.indexOf("where")>0)
				where.append(" and c.cus_id=? ");
			else
				where.append(" where c.cus_id=? ");
			queryParams[1]=cus_id;
		}
		if(start!=null){
			if(where.indexOf("where")>0)
				where.append(" and time>=? ");
			else
				where.append(" where time>=? ");
			queryParams[2]=start;
		}
		if(end!=null){
			if(where.indexOf("where")>0)
				where.append(" and time<=? ");
			else
				where.append(" where time<=? ");
			queryParams[3]=end;
		}
		if(where.indexOf("where")>0)
			where.append(" and c.cus_id=o.cus_id");
		else
			where.append(" where c.cus_id=o.cus_id");
		List<Object> list=ordersDao.listResult("select order_id,time "+where.toString(), queryParams, pageNo, maxResult);
		List<Orders> orders=new LinkedList<Orders>();
		Pagination<Orders> pagination=new Pagination<Orders>();
		for(int i=0;i<list.size();i++){
			Orders order=new Orders();
			Object[] o=(Object[]) list.get(i);
			order.setOrderId((Integer) o[0]);
			order.setTime((Timestamp) o[1]);
			orders.add(order);
		}
		int totalRecords= ((BigInteger)ordersDao.uniqueResultSQL("select count(*) "+where.toString(), queryParams)).intValue();
		pagination.setList(orders);
		pagination.setPageNo(pageNo);
		pagination.setPageSize(maxResult);
		pagination.setTotalRecords(totalRecords);
		return pagination;
	}
	@Override
	public Orders findByID(int id) {
		Orders order=ordersDao.get(id, Orders.class);
		return order;
	}
	@Override
	public Pagination<Orders> findBycusID(int id,int pageNo, int maxResult) {
		Pagination<Orders> pagination;
		String where=" where cus_id=?";
		Object[] queryParams=new Object[1];
		queryParams[0]=id;
		pagination=ordersDao.find(Orders.class, pageNo, maxResult,where, queryParams);
		return pagination;
	}
	@Override
	public boolean update(Orders orders) {
		ordersDao.update(orders);
		return true;
	}


}
