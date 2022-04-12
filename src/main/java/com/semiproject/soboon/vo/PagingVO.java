package com.semiproject.soboon.vo;

public class PagingVO {

	// 현재페이지, 시작페이지, 끝페이지, 게시글 총 개수, 페이지당
	private int currentPage = 1; // 현재페이지
	private int startPage = 1; // 시작페이지
	private int recordPerPage = 12; // 한 페이지당 표시할 DB 레코드 수(글 개수)
	private int onePageCount = 5; // 하단에 한 번에 표시할 페이지 수
	private int totalRecord; // 게시글 총 개수(DB)
	private int totalPage; // 총 페이지 수
	private int totalMember; // 총 인원수
	private int offsetIndex = 0; // 몇번째 행부터 12개씩 가져올것인지(구간정하기)

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
        // offset위치 계산
        setOffsetIndex((currentPage-1)*recordPerPage);
        // 페이지 번호의 시작값
        startPage = ((currentPage-1)/onePageCount*onePageCount)+1;
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

	public int getOnePageCount() {
		return onePageCount;
	}

	public void setOnePageCount(int onePageCount) {
		this.onePageCount = onePageCount;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		// 총 페이지 수
		if (totalRecord % recordPerPage == 0) { // 총 레코드 개수에서 한 페이지당 표시할 레코드 수가 나누어떨어지면
			totalPage = totalRecord / recordPerPage; // 나눗셈 몫이 totalPage안으로
		} else {
			totalPage = totalRecord / recordPerPage + 1; // 몫+1 해줘야 그 다음 정보가 보임!
		}
	}

	public int getTotalMember() {
		return totalMember;
	}

	public void setTotalMember(int totalMember) {
		this.totalMember = totalMember;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getOffsetIndex() {
		return offsetIndex;
	}

	public void setOffsetIndex(int offsetIndex) {
		this.offsetIndex = offsetIndex;
	}
}