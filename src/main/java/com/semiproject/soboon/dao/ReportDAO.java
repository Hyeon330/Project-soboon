package com.semiproject.soboon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.semiproject.soboon.vo.PagingVO;
import com.semiproject.soboon.vo.ReportVO;

@Mapper
@Repository
public interface ReportDAO {
		// 리스트보기
	public List<ReportVO> ReportList(PagingVO pVO);

	public int Reportcnt();
	
	public int ReportMultiDelete(ReportVO vo);

	public List<Integer> getBoardNoList(ReportVO vo);
	
	public void delreport(List<Integer> board_nos);
	
	public int insertReportContent(ReportVO vo);
}
