package com.zx.model;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Orders entity. @author MyEclipse Persistence Tools
 */

public class Orders implements java.io.Serializable {

	// Fields

	private Integer orderId;
	private Customer customer;
	private Integer quantity;
	private Double amount;
	private Timestamp time;
	private Integer state;
	private Set products = new HashSet(0);

	// Constructors

	/** default constructor */
	public Orders() {
	}

	/** minimal constructor */
	public Orders(Integer quantity, Double amount, Timestamp time, Integer state) {
		this.quantity = quantity;
		this.amount = amount;
		this.time = time;
		this.state = state;
	}

	/** full constructor */
	public Orders(Customer customer, Integer quantity, Double amount,
			Timestamp time, Integer state, Set products) {
		this.customer = customer;
		this.quantity = quantity;
		this.amount = amount;
		this.time = time;
		this.state = state;
		this.products = products;
	}

	// Property accessors

	public Integer getOrderId() {
		return this.orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Customer getCustomer() {
		return this.customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Integer getQuantity() {
		return this.quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Double getAmount() {
		return this.amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public Timestamp getTime() {
		return this.time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Set getProducts() {
		return this.products;
	}

	public void setProducts(Set products) {
		this.products = products;
	}

}