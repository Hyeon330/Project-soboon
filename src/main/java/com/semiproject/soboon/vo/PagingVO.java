package com.semiproject.soboon.vo;

public class PagingVO {
	//페이징
	private int onePageRecord = 10;  //한페이지당 출력할 레코드 수
	private int pageNum = 1; 		//현재 페이지
	private int totalRecord;		//총레코드 수
	private int offsetIndex = 0;	//오프셋
	private int onePageCount = 7; 	//한번에 표시할 페이지 수
	private int startPage = 1;
	
	public int getOnePageRecord() {
		return onePageRecord;
	}
	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		//offset위치계산
		offsetIndex = (pageNum-1)*onePageRecord;
		//페이지 번호의 시작값
		startPage = (pageNum-1)/onePageCount*onePageCount+1;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getOffsetIndex() {
		return offsetIndex;
	}
	public void setOffsetIndex(int offsetIndex) {
		this.offsetIndex = offsetIndex;
	}
	public int getOnePageCount() {
		return onePageCount;
	}
	public void setOnePageCount(int onePageCount) {
		this.onePageCount = onePageCount;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

}
