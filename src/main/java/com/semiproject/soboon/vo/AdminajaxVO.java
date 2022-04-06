package com.semiproject.soboon.vo;

public class AdminajaxVO {
	private int proNo;
	private String proName;
	private String option;
	private int price;
	private int cnt;
	
	public AdminajaxVO(int proNo, String proName, int price, int cnt) {
		this.proNo = proNo;
		this.proName = proName;
		this.price = price;
		this.cnt = cnt;
	}
	public int getProNo() {
		return proNo;
	}
	public void setProNo(int proNo) {
		this.proNo = proNo;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
}
