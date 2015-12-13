package com.zx.model;

/**
 * Picture entity. @author MyEclipse Persistence Tools
 */

public class Picture implements java.io.Serializable {

	// Fields

	private Long PId;
	private Product product;
	private String path;

	// Constructors

	/** default constructor */
	public Picture() {
	}

	/** full constructor */
	public Picture(Product product, String path) {
		this.product = product;
		this.path = path;
	}

	// Property accessors

	public Long getPId() {
		return this.PId;
	}

	public void setPId(Long PId) {
		this.PId = PId;
	}

	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}