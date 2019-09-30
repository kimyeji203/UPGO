package com.inhatc.spring.vo;

public class ProdVO {
	private Integer prod_no;
	private String prod_name;
	private String cop_no;
	private String prod_price;
	private String prod_stock;
	private String prod_content;
	private String prod_photo;
	private String prod_date;
	
	public String getProd_photo() {
		return prod_photo;
	}
	public void setProd_photo(String prod_photo) {
		this.prod_photo = prod_photo;
	}
	
	public Integer getProd_no() {
		return prod_no;
	}
	public void setProd_no(Integer prod_no) {
		this.prod_no = prod_no;
	}
	
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	
	public String getCop_no() {
		return cop_no;
	}
	public void setCop_no(String cop_no) {
		this.cop_no = cop_no;
	}
	
	public String getProd_price() {
		return prod_price;
	}
	public void setProd_price(String prod_price) {
		this.prod_price = prod_price;
	}
	
	public String getProd_stock() {
		return prod_stock;
	}
	public void setProd_stock(String prod_stock) {
		this.prod_stock = prod_stock;
	}
	
	public String getProd_content() {
		return prod_content;
	}
	public void setProd_content(String prod_content) {
		this.prod_content = prod_content;
	}
	
	public String getProd_date() {
		return prod_date;
	}
	public void setProd_date(String prod_date) {
		this.prod_date = prod_date;
	}
}