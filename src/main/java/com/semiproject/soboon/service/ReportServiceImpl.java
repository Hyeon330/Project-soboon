package com.semiproject.soboon.service;

import java.util.List;

import javax.inject.Inject;
import com.semiproject.soboon.dao.ReportDAO;
import com.semiproject.soboon.vo.ReportVO;

public class ReportServiceImpl implements ReportService {

	@Inject
	ReportDAO dao;
	
	@Override
	public List<ReportVO> reportList(int no) {
		return dao.reportList(no);
	}
}
