package com.zx.action.customer;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ExceptionMapping;
import org.apache.struts2.convention.annotation.ExceptionMappings;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.zx.action.BaseAction;
import com.zx.model.Customer;
import com.zx.service.CustomerServiceI;
import com.zx.util.AppException;
import com.zx.util.Encrypt;

@ParentPackage("basePackage")
@Namespace("/customer")
@Action("customerAction")
@Results({
	@Result(name="index",location="/customer/return_index.jsp"),
	@Result(name="customerLogin",location="/customer/customer_login.jsp"),
	@Result(name="register",location="/customer/customer_register.jsp"),
	@Result(name="input",location="/customer/customer_register.jsp"),
	@Result(name="error",location="/common/error.jsp"),
	@Result(name="edit",location="/customer/customer_update.jsp"),
	@Result(name="success",location="/customer/return_index.jsp")
})
@ExceptionMappings({
	@ExceptionMapping(exception="com.zx.util.AppException",result="error")
})
public class CustomerAction extends BaseAction implements ModelDriven<Customer> {

	private CustomerServiceI customerService;
	
	public CustomerServiceI getCustomerService() {
		return customerService;
	}
	@Autowired
	public void setCustomerService(CustomerServiceI customerService) {
		this.customerService = customerService;
	}

	private static final long serialVersionUID = 1L;

	// 客户
	private Customer customer = new Customer();
	// 确认密码
	private String repassword;

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	@Override
	public Customer getModel() {
		return customer;
	}

	@SkipValidation
	public String login() throws Exception {
		return CUSTOMER_LOGIN;
	}

	/** 
	 * 用户注册
	 * 
	 * @return
	 * @throws Exception
	 */
	public String save() throws Exception {
		boolean unique = customerService.isUnique(customer.getUsername());// 判断用户名是否可用
		if (unique) {// 如果用户名可用
			customer.setPassword(Encrypt.md5(customer.getPassword()));
			customerService.save(customer);// 保存注册信息
			return CUSTOMER_LOGIN;// 返回会员登录页面
		} else {
			throw new AppException("此用户名不可用");// 否则返回页面错误信息
		}
	}

	/**
	 * 用户登录
	 * 
	 * @return
	 * @throws Exception
	 */
	@SkipValidation
	public String logon() throws Exception {
		// 验证用户名和密码是否正确
		Customer loginCustomer = customerService.login(customer.getUsername(),
				Encrypt.md5(customer.getPassword()));
		if (loginCustomer != null) {// 如果通过验证
			session.put("customer", loginCustomer);// 将登录会员信息保存在Session中
		} else {// 验证失败
			addFieldError("", "用户名或密码不正确！");// 返回错误信息
			return CUSTOMER_LOGIN;// 返回会员登录页面
		}
		return INDEX;// 返回网站首页
	}

	/**
	 * 用户退出
	 * 
	 * @return String
	 * @throws Exception
	 */
	@SkipValidation
	public String logout() throws Exception {
		if (session != null && session.size() > 0) {
			session.clear();
		}
		return INDEX;
	}
	
	@SkipValidation
	public String edit(){
		return EDIT;
	}
	
	@SkipValidation
	public String update(){
		Customer cus=(Customer) session.get("customer");
		if(cus.getPassword().equals(Encrypt.md5(customer.getPassword()))){
			cus.setPassword(Encrypt.md5(repassword));
			customerService.update(cus);
			return SUCCESS;
		}else{
			addFieldError("", "原密码错误");
			return EDIT;
		}
	}
}
