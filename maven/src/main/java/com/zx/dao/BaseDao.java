package com.zx.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.zx.model.Pagination;

public interface BaseDao<T> {
	public void save(T obj); // 保存数据

	public void saveOrUpdate(T obj); // 保存或修改数据

	public void update(T obj); // 修改数据

	public void delete(Class<T> entityClass,Serializable... ids); // 删除数据
//
	public T get(Serializable entityId,Class<T> entityClass); // 加载实体对象
//
//	public T load(Serializable entityId); // 加载实体对象

	public Object uniqueResult(String hql, Object[] queryParams); // 使用hql语句操作
	
	public Object uniqueResultSQL(String sql, Object[] queryParams); // 使用sql语句操作

	public List<Object> listResult(String sql,Object[] queryParams,final int pageNo,
			final int maxResult);//使用sql语句获得list结果
//	public long getCount();// 获取记录总数

//	public Pagination<T> find(int pageNo, int maxResult);// 普通分页操作
//
	public Pagination<T> find(Class<T> entityClass,int pageNo, int maxResult, String where,
			Object[] queryParams);// 搜索信息分页方法

//	public Pagination<T> find(int pageNo, int maxResult,
//			Map<String, String> orderby);// 按指定条件排序分页方法
//
	public Pagination<T> find(Class<T> entityClass,String where, Object[] queryParams,
			Map<String, String> orderby, int pageNo, int maxResult);// 按指定条件分页和排序的分页方法
}
