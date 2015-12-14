package com.zx.action.saler;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.zx.action.BaseAction;
import com.zx.model.Pagination;
import com.zx.model.Saler;
import com.zx.service.SalerServiceI;

@Namespace("/saler")
@Action("salerAction")
@Results({
	@Result(name="index",location="/saler/saler_operate.jsp"),
	@Result(name="edit",location="/saler/saler_add.jsp")
})
public class SalerAction extends BaseAction implements ModelDriven<Saler>{
	private Saler saler=new Saler();
	private SalerServiceI salerService;
	private Pagination<Saler> pagination;
	
	public SalerServiceI getSalerService() {
		return salerService;
	}
	@Autowired
	public void setSalerService(SalerServiceI salerService) {
		this.salerService = salerService;
	}
	
	public Pagination<Saler> getPagination() {
		return pagination;
	}
	public void setPagination(Pagination<Saler> pagination) {
		this.pagination = pagination;
	}
	public Saler getSaler() {
		return saler;
	}
	public void setSaler(Saler saler) {
		this.saler = saler;
	}
	@Override
	public Saler getModel() {
		return saler;
	}
	
	public String index(){
		return INDEX;
	}
	
	public String add(){
		if(saler.getName().length()==0||saler.getName()==null){
			addFieldError("", "商户名不能为空");
			return EDIT;
		}
		if(saler.getAdress().length()==0||saler.getAdress()==null){
			addFieldError("", "地址不能为空");
			return EDIT;
		}
		if(saler.getAccount().length()==0||saler.getAdress()==null){
			addFieldError("", "商户帐号不能为空");
		}
		if(salerService.save(saler)){
			return SUCCESS;
		}
		addFieldError("", "添加失败，已有此商户名！");
		return EDIT;
	}

	public String edit(){
		if(saler.getSalerId()!=null)
			saler=salerService.findByID(saler.getSalerId());
		return EDIT;
	}
	
	public String select(){
		pagination=salerService.findByName(saler.getName(), pageNo, pageSize);
		return INDEX;
	}
	
	public String update(){
		boolean flag=salerService.update(saler);
		if(flag==true)
			return SUCCESS;
		else{
			addFieldError("", "失败，请检查商户名");
			return EDIT;
		}
	}
	
	public String delete(){
		if(salerService.delete(saler))
			return SUCCESS;
		addFieldError("", "删除失败");
		return INDEX;
	}
}
