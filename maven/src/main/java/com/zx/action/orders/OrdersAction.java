package com.zx.action.orders;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ModelDriven;
import com.zx.action.BaseAction;
import com.zx.model.Customer;
import com.zx.model.Orders;
import com.zx.model.Pagination;
import com.zx.model.Product;
import com.zx.service.OrdersServiceI;
import com.zx.service.ProductServiceI;
@Namespace("/orders")
@Action("ordersAction")
@Results({
	@Result(name="add",location="/orders/order_success.jsp"),
	@Result(name="index",location="/orders/admin_manage.jsp"),
	@Result(name="detail",location="/orders/order_detail.jsp"),
	@Result(name="cusIndex",location="/orders/customer_manager.jsp"),
	@Result(name="cusdetail",location="/orders/customer_order_detail.jsp"),
	@Result(name="success",location="/orders/update_success.jsp")
})
public class OrdersAction extends BaseAction implements ModelDriven<Orders>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Orders orders=new Orders();
	private OrdersServiceI ordersService;
	private Integer productId;
	private ProductServiceI productService;
	private Timestamp start;
	private Timestamp end;
	private Pagination<Orders> pagination;
	private  String username;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Pagination<Orders> getPagination() {
		return pagination;
	}

	public void setPagination(Pagination<Orders> pagination) {
		this.pagination = pagination;
	}
	public Timestamp getStart() {
		return start;
	}

	public void setStart(Timestamp start) {
		this.start = start;
	}

	public Timestamp getEnd() {
		return end;
	}

	public void setEnd(Timestamp end) {
		this.end = end;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Orders getOrders() {
		return orders;
	}

	public void setOrders(Orders orders) {
		this.orders = orders;
	}
	@Autowired
	public void setOrdersService(OrdersServiceI ordersService) {
		this.ordersService = ordersService;
	}
	@Autowired
	public void setProductService(ProductServiceI productService) {
		this.productService = productService;
	}

	@Override
	public Orders getModel() {
		return orders;
	}
	
	public String save(){
		Customer customer=(Customer)session.get("customer");
		Set<Product> products=new HashSet<Product>();
		Product product=productService.findByID(productId);
		product.setSales(product.getSales()+orders.getQuantity());
		product.setStockNumber(product.getStockNumber()-orders.getQuantity());
		products.add(product);
		orders.setProducts(products);
		orders.setCustomer(customer);
		orders.setAmount(product.getPrice()*orders.getQuantity());
		orders.setState(0);
		orders.setTime(new Timestamp(System.currentTimeMillis()));
		if(ordersService.add(orders))
			return ADD;
		else{
			addFieldError("", "提交订单失败");
			return null;
		}
	}
	
	public String list(){
		pagination=ordersService.find(username, null, start, end, pageNo, pageSize);
		return INDEX;
	}
	
	public String index(){
		pagination=ordersService.find(null, null, null, null, pageNo, pageSize);
		return INDEX;
	}
	
	public String selectById(){
		orders=ordersService.findByID(orders.getOrderId());
		return DETAIL;
	}
	
	public String cusIndex(){
		Customer customer=(Customer) session.get("customer");
		pagination=ordersService.findBycusID(customer.getCusId(), pageNo, 5);
		return "cusIndex";
	}
	
	public String cusDetail(){
		orders=ordersService.findByID(orders.getOrderId());
		return "cusdetail";
	}
	
	public String confirm(){
		orders=ordersService.findByID(orders.getOrderId());
		orders.setState(1);
		if(ordersService.update(orders))
			return SUCCESS;
		return null;
	}
	
	public String cancle(){
		orders=ordersService.findByID(orders.getOrderId());
		Set<Product> set=orders.getProducts();
		for(Product p:set){
			p.setStockNumber(p.getStockNumber()+orders.getQuantity());
			p.setSales(p.getSales()-orders.getQuantity());
		}
		orders.setState(2);
		if(ordersService.update(orders))
			return SUCCESS;
		return null;
	}
}
