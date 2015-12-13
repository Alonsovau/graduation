package com.zx.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Category entity. @author MyEclipse Persistence Tools
 */

public class Category implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer cateId;
	private String name;
	private Set<Product> products = new HashSet<Product>(0);

	// Constructors

	/** default constructor */
	public Category() {
	}

	/** full constructor */
	public Category(String name, Set<Product> products) {
		this.name = name;
		this.products = products;
	}

	// Property accessors

	public Integer getCateId() {
		return this.cateId;
	}

	public void setCateId(Integer cateId) {
		this.cateId = cateId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Product> getProducts() {
		return this.products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

}