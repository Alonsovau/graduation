package com.zx.action.admin;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.zx.action.BaseAction;
import com.zx.model.Admin;
import com.zx.service.AdminServiceI;
import com.zx.util.Encrypt;
@Namespace("/admin")
@Action("adminAction")
@Results({
	@Result(name="welcome",location="/admin/admin_welcome.jsp"),
	@Result(name="adminLogin",location="/admin/admin_login.jsp")
})
public class AdminAction extends BaseAction implements ModelDriven<Admin>{
	
	private AdminServiceI adminService;
	
	public AdminServiceI getAdminService() {
		return adminService;
	}
	@Autowired
	public void setAdminService(AdminServiceI adminService) {
		this.adminService = adminService;
	}
	
	private Admin admin=new Admin();
	

	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	/**
	 * 管理员登录
	 * 
	 * @return
	 * @throws Exception
	 */
	@SkipValidation
	public String logon() throws Exception {
		// 验证用户名和密码是否正确
		Admin loginAdmin=adminService.login(admin.getUsername(), Encrypt.md5(admin.getPassword()));
		if (loginAdmin != null) {// 如果通过验证
			session.put("admin", loginAdmin);// 将登录会员信息保存在Session中
		} else {// 验证失败
			addFieldError("", "用户名或密码不正确！");// 返回错误信息
			return ADMIN_LOGIN;// 返回会员登录页面
		}
		return WELCOME;// 返回网站首页
	}
	@SkipValidation
	public String login() throws Exception{
		return ADMIN_LOGIN;
	}
	
	public String index() throws Exception{
		if(session.get("admin")!=null)
			return WELCOME;
		return ADMIN_LOGIN;
	}
	
	@Override
	public Admin getModel() {
		return admin;
	}

}
