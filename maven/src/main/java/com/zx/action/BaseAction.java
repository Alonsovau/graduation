package com.zx.action;

import java.util.Map;

import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
import com.zx.service.CustomerServiceI;
 
@SuppressWarnings("unused")
public class BaseAction extends ActionSupport implements RequestAware,SessionAware, ApplicationAware {
	private static final long serialVersionUID = 1L;
	protected int pageSize = 2;
	protected int pageNo = 1;
	public static final String LIST = "list";
	public static final String EDIT = "edit";
	public static final String ADD = "add";
	public static final String SELECT = "select";
	public static final String QUERY = "query";
	public static final String INDEX = "index";
	public static final String Register = "register";
	public static final String CUSTOMER_LOGIN = "customerLogin";
	public static final String ADMIN_LOGIN="adminLogin";
	public static final String LOGOUT = "logout";
	public static final String ERROR = "error";
	public static final String WELCOME="welcome";
	public static final String INITADD="initadd";
	public static final String DETAIL="detail";
	
	// 获取普通用户对象
/*	public Customer getLoginCustomer(){
		if(session.get("customer") != null){
			return (Customer) session.get("customer");
		}
		return null;
	}*/
	// 从session中取出购物车
//	@SuppressWarnings("unchecked")
//	protected Set<OrderItem> getCart(){
//		Object obj = session.get("cart");
//		if(obj == null){
//			return new HashSet<OrderItem>();
//		}else{
//			return (Set<OrderItem>) obj;
//		}
//	}	
//	// 注入Dao
//	@Autowired
//	protected ProductDao productDao;
//	@Autowired
//	protected OrderDao orderDao;
//	@Autowired
//	protected CustomerServiceI customerDao;	
	// Map类型的request
	protected Map<String, Object> request;
	// Map类型的session
	protected Map<String, Object> session;
	// Map类型的application
	protected Map<String, Object> application;
	
	@Override
	public void setRequest(Map<String, Object> request) {
		// 获取Map类型的request赋值
		this.request = request;
	}
	@Override
	public void setApplication(Map<String, Object> application) {
		// 获取Map类型的application赋值
		this.application = application;
	}
	@Override
	public void setSession(Map<String, Object> session) {
		// 获取Map类型的session赋值
		this.session = session;
	}
	
	// 处理方法
	public String execute() throws Exception {
		return SUCCESS;
	}	
	@SkipValidation
	public String index() throws Exception {
		return INDEX;
	}
	public String add() throws Exception {
		return ADD;
	}
	public String select() throws Exception {
		return SELECT;
	}
	public String query() throws Exception{
		return QUERY;
	}
	@SkipValidation
	public String register() throws Exception{
		return Register;
	}
	@SkipValidation
	public String error() throws Exception{
		return ERROR;
	}
	// getter()和setter()方法	
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
}
