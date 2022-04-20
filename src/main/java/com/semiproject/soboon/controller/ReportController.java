package com.semiproject.soboon.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.semiproject.soboon.service.ReportService;
import com.semiproject.soboon.vo.ReportVO;

@RequestMapping("/report/")
@RestController
public class ReportController {

	@Inject
	ReportService service;
	
	@PostMapping("insertReportContent")
	public int insertReportContent(ReportVO vo, HttpSession session) {
		System.out.println(vo.getReport_content());
		vo.setReporter((String)session.getAttribute("logId"));
		return service.insertReportContent(vo);
	}
}
