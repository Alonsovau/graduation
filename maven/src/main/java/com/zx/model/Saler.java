package com.zx.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Saler entity. @author MyEclipse Persistence Tools
 */

public class Saler implements java.io.Serializable {

	// Fields

	private Integer salerId;
	private String name;
	private String adress;
	private String account;
	private Set products = new HashSet(0);

	// Constructors

	/** default constructor */
	public Saler() {
	}

	/** full constructor */
	public Saler(String name, String adress, String account, Set products) {
		this.name = name;
		this.adress = adress;
		this.account = account;
		this.products = products;
	}

	// Property accessors

	public Integer getSalerId() {
		return this.salerId;
	}

	public void setSalerId(Integer salerId) {
		this.salerId = salerId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAdress() {
		return this.adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public Set getProducts() {
		return this.products;
	}

	public void setProducts(Set products) {
		this.products = products;
	}

}