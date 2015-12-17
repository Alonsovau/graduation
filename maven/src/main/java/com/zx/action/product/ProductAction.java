package com.zx.action.product;

import java.io.File;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Properties;
import java.util.Set;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.zx.action.BaseAction;
import com.zx.model.Category;
import com.zx.model.Picture;
import com.zx.model.Product;
import com.zx.model.Saler;
import com.zx.service.CategoryServiceI;
import com.zx.service.ProductServiceI;
import com.zx.service.SalerServiceI;

@Action("productAction")
@Results({
	@Result(name="edit",location="/product/product_add.jsp"),
	@Result(name="index",location="/product/product_operate.jsp"),
	@Result(name="input",location="/index.jsp"),
	@Result(name="success",location="/common/admin_success.jsp")
})
public class ProductAction extends BaseAction implements ModelDriven<Product>{

	private Product product=new Product();
	private CategoryServiceI categoryService;
	private SalerServiceI salerService;
	private ProductServiceI productService;
	private List<Category> categoryList;
	private List<Saler> salerList;
	private List<File> files;
	private Integer categoryId;
	private Integer salerId;
	private String salerName;
	
	@Autowired
	public void setProductService(ProductServiceI productService) {
		this.productService = productService;
	}

	@Autowired
	public void setCategoryService(CategoryServiceI categoryService) {
		this.categoryService = categoryService;
	}
	@Autowired
	public void setSalerService(SalerServiceI salerService) {
		this.salerService = salerService;
	}

	public List<Category> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}

	public List<Saler> getSalerList() {
		return salerList;
	}

	public void setSalerList(List<Saler> salerList) {
		this.salerList = salerList;
	}

	public void setFiles(List<File> files) {
		this.files = files;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public Integer getSalerId() {
		return salerId;
	}

	public void setSalerId(Integer salerId) {
		this.salerId = salerId;
	}

	public void setSalerName(String salerName) {
		this.salerName = salerName;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public Product getModel() {
		return product;
	}

	public String edit(){
		categoryList=categoryService.findByName(null, -1, -1).getList();
		salerList=salerService.findByName(null, -1, -1).getList();
		return EDIT;
	}
	
	public String add() throws Exception{
		if(product.getName().length()==0||product.getName()==null){
			addFieldError("", "产品名不能为空");
			return edit();
		}
		if(product.getPrice()==null){
			addFieldError("", "价格不能为空");
			return edit();
		}
		if(product.getStockNumber()==null){
			addFieldError("", "库存不能为空");
			return edit();
		}
		Properties properties=new Properties();
		properties.load(getClass().getResourceAsStream("/config.properties"));
		String path=properties.get("uploadDirectory").toString();
		Set<Picture> pictures=new HashSet<Picture>(0);
		if (files.size() > 0) {
			for (File file : files) {
				String fullPath = path + "/" + salerId.toString() + "/"
						+ UUID.randomUUID().toString() + ".jpg";
				FileUtils.copyFile(file, new File(fullPath));
				Picture picture = new Picture();
				picture.setProduct(product);
				picture.setPath(fullPath);
				pictures.add(picture);
			}
			product.setPictures(pictures);
		}
		product.setCategory(categoryService.findByID(categoryId));
		product.setSaler(salerService.findByID(salerId));
		if(productService.save(product))
			return SUCCESS;
		return edit();
	}
}
