package com.semiproject.soboon.vo;

import java.util.List;

public class ReportVO {
	private int no;
	private String reporter;
	private String suspect;
	private String report_content;
	private int board_no;
	private List<Integer> noList;
	private String category;
	
	public List<Integer> getNoList() {
		return noList;
	}
	public void setNoList(List<Integer> noList) {
		this.noList = noList;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getReporter() {
		return reporter;
	}
	public void setReporter(String reporter) {
		this.reporter = reporter;
	}
	public String getSuspect() {
		return suspect;
	}
	public void setSuspect(String suspect) {
		this.suspect = suspect;
	}
	public String getReport_content() {
		return report_content;
	}
	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "ReportController [getNo()=" + getNo() + ", getReporter()=" + getReporter() + ", getSuspect()="
				+ getSuspect() + ", getReport_content()=" + getReport_content() + "]";
	}
}