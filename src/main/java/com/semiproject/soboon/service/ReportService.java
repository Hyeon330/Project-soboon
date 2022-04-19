package com.semiproject.soboon.service;

import java.util.List;

import com.semiproject.soboon.vo.PagingVO;
import com.semiproject.soboon.vo.ReportVO;

public interface ReportService {
		// 리스트보기
	public List<ReportVO> ReportList(PagingVO pVO);

	public int getReportcnt();
	
	public int ReportMultiDelete(ReportVO vo);

	public List<Integer> getBoardNoList(ReportVO vo);
	
	public void delreport(List<Integer> board_nos);
}

