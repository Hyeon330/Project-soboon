package com.semiproject.soboon.vo;

public class PagingVO {
	
	// 현재페이지, 시작페이지, 끝페이지, 게시글 총 개수, 페이지당
	private int currentPage = 1;    // 현재페이지
	private int startPage = 1;      // 시작페이지
	private int recordPerPage = 12;  // 한 페이지당 표시할 DB 레코드 수(글 개수)
	private int totalRecord;        // 게시글 총 개수(DB)
	private int totalPage;          // 하단에 한 번에 나타날 개수 
	
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getRecordPerPage() {
		return recordPerPage;
	}
	public void setRecordPerPage(int recordPerPage) {
		this.recordPerPage = recordPerPage;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		// 총 페이지 수
		if(totalRecord%recordPerPage==0) { // 총 레코드 개수에서 한 페이지당 표시할 레코드 수가 나누어떨어지면
			totalPage = totalRecord/recordPerPage;  // 나눗셈 몫이 totalPage안으로
		}else {
			totalPage = totalRecord/recordPerPage+1; // 몫+1 해줘야 그 다음 정보가 보임!
		}
		
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
}
	
	