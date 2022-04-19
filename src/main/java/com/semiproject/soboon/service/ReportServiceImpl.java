package com.semiproject.soboon.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.semiproject.soboon.dao.ReportDAO;
import com.semiproject.soboon.vo.PagingVO;
import com.semiproject.soboon.vo.ReportVO;

@Service
public class ReportServiceImpl implements ReportService {

	@Inject
	ReportDAO dao;
	
	@Override
	public List<ReportVO> ReportList(PagingVO pVO){
		return dao.ReportList(pVO);
	}
	@Override
	public int getReportcnt() {
		return dao.Reportcnt();
	}
	@Override
	public int ReportMultiDelete(ReportVO vo) {
		return dao.ReportMultiDelete(vo);
	}
	@Override
	public List<Integer> getBoardNoList(ReportVO vo) {
		return dao.getBoardNoList(vo);
	}
	@Override
	public void delreport(List<Integer> board_nos) {
		dao.delreport(board_nos);	
	}
}
