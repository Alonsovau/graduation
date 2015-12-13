package com.zx.action.category;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.zx.action.BaseAction;
import com.zx.model.Category;
import com.zx.model.Pagination;
import com.zx.service.CategoryServiceI;

@Action("categoryAction")
@Results({
	@Result(name="success",location="/category/category_success.jsp"),
	@Result(name="index",location="/category/category_operate.jsp"),
	@Result(name="edit",location="/category/category_update.jsp")
})
public class CategoryAction extends BaseAction implements ModelDriven<Category> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Category category=new Category();
	private CategoryServiceI categoryService;
	private Pagination<Category> pagination;
	
	
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Autowired
	public void setCategoryService(CategoryServiceI categoryService) {
		this.categoryService = categoryService;
	}

	@Override
	public Category getModel() {
		return category;
	}
	
	public Pagination<Category> getPagination() {
		return pagination;
	}

	public void setPagination(Pagination<Category> pagination) {
		this.pagination = pagination;
	}

	public String add(){
		if(category.getName().length()==0||category.getName()==null){
			addFieldError("", "不能为空");
			return INDEX;
		}
		if(categoryService.save(category)){
			return SUCCESS;
		}
		addFieldError("", "添加失败，已有此类别！");
		return INDEX;
	}
	
	public String index(){
		return INDEX;
	}
	
	public String select(){
		pagination=categoryService.findByName(category.getName(), pageNo, pageSize);
		return INDEX;
	}
	
	public String edit(){
		category=categoryService.findByID(category.getCateId());
		return EDIT;
	}
	
	public String update(){
		boolean flag=categoryService.update(category);
		if(flag==true)
			return SUCCESS;
		else{
			addFieldError("", "失败，请检查类名");
			return EDIT;
		}
	}
	
	public String delete(){
		if(categoryService.delete(category))
			return SUCCESS;
		addFieldError("", "删除失败");
		return INDEX;
	}
}
