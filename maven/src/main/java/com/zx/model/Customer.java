package com.zx.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Customer entity. @author MyEclipse Persistence Tools
 */

public class Customer implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer cusId;
	private String username;
	private String password;
	private String realname;
	private String email;
	private String phone;
	private Set<Orders> orderses = new HashSet<Orders>(0);

	// Constructors

	/** default constructor */
	public Customer() {
	}

	/** minimal constructor */
	public Customer(String username, String password) {
		this.username = username;
		this.password = password;
	}

	/** full constructor */
	public Customer(String username, String password, String realname,
			String email, String phone, Set<Orders> orderses) {
		this.username = username;
		this.password = password;
		this.realname = realname;
		this.email = email;
		this.phone = phone;
		this.orderses = orderses;
	}

	// Property accessors

	public Integer getCusId() {
		return this.cusId;
	}

	public void setCusId(Integer cusId) {
		this.cusId = cusId;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealname() {
		return this.realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Set<Orders> getOrderses() {
		return this.orderses;
	}

	public void setOrderses(Set<Orders> orderses) {
		this.orderses = orderses;
	}

}