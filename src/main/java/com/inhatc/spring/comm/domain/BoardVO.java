package com.inhatc.spring.comm.domain;

public class BoardVO {
	private int b_no;
	private String b_title;
	private String b_content;
	private String b_writer;
	private String b_date;
	private int b_hits=0;
	
	private int cop_no;
	private int prod_no;
	
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_writer() {
		return b_writer;
	}
	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public int getB_hits() {
		return b_hits;
	}
	public void setB_hits(int b_hits) {
		this.b_hits = b_hits;
	}
	public int getCop_no() {
		return cop_no;
	}
	public void setCop_no(int cop_no) {
		this.cop_no = cop_no;
	}
	public int getProd_no() {
		return prod_no;
	}
	public void setProd_no(int prod_no) {
		this.prod_no = prod_no;
	}
	
}
