package kr.co.pressfit.vo;

import java.util.Date;

public class CartVO {

	private int idx;
	private int cart_id;
	private int amount;
	private int price;
	private String dprice;
	private String items_select;
	private String manufacturecompany;
	private String modelname;
	private String payment;
	private String user_id;
	private String money;
	private String fullName;
	private String kind;
	private String crea_id;
	private int shippingStatus;
	private Date orderdate;
	private String methodpayment;
	private String searchOption;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDprice() {
		return dprice;
	}
	public void setDprice(String dprice) {
		this.dprice = dprice;
	}
	public String getItems_select() {
		return items_select;
	}
	public void setItems_select(String items_select) {
		this.items_select = items_select;
	}
	public String getManufacturecompany() {
		return manufacturecompany;
	}
	public void setManufacturecompany(String manufacturecompany) {
		this.manufacturecompany = manufacturecompany;
	}
	public String getModelname() {
		return modelname;
	}
	public void setModelname(String modelname) {
		this.modelname = modelname;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getCrea_id() {
		return crea_id;
	}
	public void setCrea_id(String crea_id) {
		this.crea_id = crea_id;
	}
	public int getShippingStatus() {
		return shippingStatus;
	}
	public void setShippingStatus(int shippingStatus) {
		this.shippingStatus = shippingStatus;
	}
	public Date getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}
	public String getMethodpayment() {
		return methodpayment;
	}
	public void setMethodpayment(String methodpayment) {
		this.methodpayment = methodpayment;
	}
	public String getSearchOption() {
		return searchOption;
	}
	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}
	@Override
	public String toString() {
		return "CartVO [idx=" + idx + ", cart_id=" + cart_id + ", amount=" + amount + ", price=" + price + ", dprice="
				+ dprice + ", items_select=" + items_select + ", manufacturecompany=" + manufacturecompany
				+ ", modelname=" + modelname + ", payment=" + payment + ", user_id=" + user_id + ", money=" + money
				+ ", fullName=" + fullName + ", kind=" + kind + ", crea_id=" + crea_id + ", shippingStatus="
				+ shippingStatus + ", methodpayment=" + methodpayment + ", searchOption=" + searchOption + "]";
	}
	
	
	
}
