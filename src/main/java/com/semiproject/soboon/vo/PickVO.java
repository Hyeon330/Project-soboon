package com.semiproject.soboon.vo;

import java.util.List;

public class PickVO {

	private int pickno;
	private int no;
	private String userid;
	
	private List<Integer> picknoList;
	
	public int getPickno() {
		return pickno;
	}
	public void setPickno(int pickno) {
		this.pickno = pickno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public List<Integer> getPicknoList() {
		return picknoList;
	}
	public void setPicknoList(List<Integer> picknoList) {
		this.picknoList = picknoList;
	}
	
	
}
