package com.zx.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.zx.model.Pagination;
import com.zx.util.GenericsUtils;

@Repository("baseDao")
@Transactional
@SuppressWarnings("unchecked")
public class BaseDaoImpl<T> implements BaseDao<T>{

	/**
	 * 获取Session对象
	 * @return
	 */
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	protected Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	/**
	 * 利用save()方法保存对象的详细信息
	 */
	@Override
	public void save(T obj) {
		getSession().save(obj);
	}
	@Override
	public void saveOrUpdate(Object obj) {
		getSession().saveOrUpdate(obj);
	}
	/**
	 * 利用update()方法修改对象的详细信息
	 */
	@Override
	public void update(Object obj) {
		getSession().update(obj);
	}
	@Override
	public void delete(Class<T> entityClass,Serializable ... ids) {
		for (Serializable id : ids) {
			T t = (T) getSession().load(entityClass, id);
			getSession().delete(t);
		}
	}
	/**
	 * 利用get()方法加载对象，获取对象的详细信息
	 */
//	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public T get(Serializable entityId,Class<T> entityClass) {
		return (T) getSession().get(entityClass, entityId);
	}
	/**
	 * 利用load()方法加载对象，获取对象的详细信息
	 */
//	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
//	public T load(Serializable entityId) {
//		return (T) getSession().load(this.entityClass, entityId);
//	}
	/**
	 * 利用HQL语句查找单条信息
	 */
	@Override
	public Object uniqueResult(final String hql,final Object[] queryParams) {
		Query query=getSession().createQuery(hql);
		setQueryParams(query, queryParams);//设置查询参数
		return query.uniqueResult();
	}
	/**
	 * 对query中的参数赋值
	 * @param query
	 * @param queryParams
	 */
	protected void setQueryParams(Query query, Object[] queryParams){
		if(queryParams!=null && queryParams.length>0){
			for(int i=0; i<queryParams.length; i++){
				query.setParameter(i, queryParams[i]);
			}
		}
	}
	/**
	 * 获取指定对象的记录条数
	 */
//	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
//	public long getCount() {
//		String hql = "select count(*) from " + GenericsUtils.getGenericName(this.entityClass);
//		return (Long)uniqueResult(hql,null);
//	}

//	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
//	public Pagination<T> find(final int pageNo, int maxResult) {
//		return find(null, null, null, pageNo, maxResult);
//	}
//	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
//	public Pagination<T> find(int pageNo, int maxResult,
//			Map<String, String> orderby) {
//		return find(null, null, orderby, pageNo, maxResult);
//	}
//	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public Pagination<T> find(Class<T> entityClass,int pageNo, int maxResult, String where,
			Object[] queryParams) {
		return find(entityClass, where, queryParams, null, pageNo, maxResult);
	}
	/**
	 * 分页查询
	 * @param where 查询条件
	 * @param queryParams hql参数值
	 * @param orderby 排序
	 * @param pageNo 第几页
	 * @param maxResult 返回记录数量
	 * return Pagination
	 */
//	@Transactional(propagation=Propagation.NOT_SUPPORTED,readOnly=true)
	public Pagination<T> find(Class<T> entityClass,final String where, final Object[] queryParams,
			final Map<String, String> orderby, final int pageNo,
			final int maxResult) {
		final Pagination<T> Pagination = new Pagination<T>();   //实例化分页对象
		Pagination.setPageNo(pageNo);                         //设置当前页数
		Pagination.setPageSize(maxResult);                     //设置每页显示记录数
		String hql = new StringBuffer().append("from ")       //添加form字段
		.append(GenericsUtils.getGenericName(entityClass))    //添加对象类型
		.append(" ")                                          //添加空格
		.append(where == null ? "" : where)  //如果where为null就添加空格,反之添加where
		.append(createOrderBy(orderby))                     //添加排序条件参数
		.toString();                                        //转化为字符串
		Query query = getSession().createQuery(hql);        //执行查询
		setQueryParams(query,queryParams);                  //为参数赋值
		List<T> list = null;                                //定义List对象
		// 如果maxResult<0，则查询所有
		if(maxResult < 0 && pageNo < 0){
		list = query.list();              //将查询结果转化为List对象
		}else{
		list = query.setFirstResult(getFirstResult(pageNo, maxResult))//设置分页起始位置
				.setMaxResults(maxResult)//设置每页显示的记录数
				.list();//将查询结果转化为List对象
		//定义查询总记录数的HQL语句
		hql = new StringBuffer().append("select count(*) from ")        //添加HQL语句
					.append(GenericsUtils.getGenericName(entityClass))  //添加对象类型
					.append(" ")                                        //添加空格
					.append(where == null ? "" : where)//如果where为null就添加空格,反之添加where
					.toString();                    //转化为字符串
		query = getSession().createQuery(hql);      //执行查询
		setQueryParams(query,queryParams);          //设置HQL参数
		int totalRecords = ((Long) query.uniqueResult()).intValue();  //类型转换
		Pagination.setTotalRecords(totalRecords);                      //设置总记录数
		}
		Pagination.setList(list);                   //将查询的list对象放入实体对象中		
		return Pagination;                          //返回分页的实体对象
	}
	/**
	 * 获取分页查询中结果集的起始位置
	 * @param pageNo 第几页
	 * @param maxResult 页面显示的记录数
	 * @return 起始位置
	 */
	protected int getFirstResult(int pageNo,int maxResult){
		int firstResult = (pageNo-1) * maxResult;
		return firstResult < 0 ? 0 : firstResult;
	}
	/**
	 * 创建排序hql语句
	 * @param orderby
	 * @return 排序字符串
	 */
	protected String createOrderBy(Map<String, String> orderby){
		StringBuffer sb = new StringBuffer("");
		if(orderby != null && orderby.size() > 0){
			sb.append(" order by ");
			for(String key : orderby.keySet()){
				sb.append(key).append(" ").append(orderby.get(key)).append(",");
			}
			sb.deleteCharAt(sb.length() - 1);
		}
		return sb.toString();
	}
}