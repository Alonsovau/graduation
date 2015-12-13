package com.zx.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Product entity. @author MyEclipse Persistence Tools
 */

public class Product implements java.io.Serializable {

	// Fields

	private Integer productId;
	private Category category;
	private Saler saler;
	private String name;
	private Double price;
	private Integer stockNumber;
	private String description;
	private Integer sales;
	private Set orderses = new HashSet(0);
	private Set pictures = new HashSet(0);

	// Constructors

	/** default constructor */
	public Product() {
	}

	/** full constructor */
	public Product(Category category, Saler saler, String name, Double price,
			Integer stockNumber, String description, Integer sales,
			Set orderses, Set pictures) {
		this.category = category;
		this.saler = saler;
		this.name = name;
		this.price = price;
		this.stockNumber = stockNumber;
		this.description = description;
		this.sales = sales;
		this.orderses = orderses;
		this.pictures = pictures;
	}

	// Property accessors

	public Integer getProductId() {
		return this.productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Saler getSaler() {
		return this.saler;
	}

	public void setSaler(Saler saler) {
		this.saler = saler;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getStockNumber() {
		return this.stockNumber;
	}

	public void setStockNumber(Integer stockNumber) {
		this.stockNumber = stockNumber;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getSales() {
		return this.sales;
	}

	public void setSales(Integer sales) {
		this.sales = sales;
	}

	public Set getOrderses() {
		return this.orderses;
	}

	public void setOrderses(Set orderses) {
		this.orderses = orderses;
	}

	public Set getPictures() {
		return this.pictures;
	}

	public void setPictures(Set pictures) {
		this.pictures = pictures;
	}

}