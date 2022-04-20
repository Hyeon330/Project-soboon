package com.semiproject.soboon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.semiproject.soboon.service.MemberService;
import com.semiproject.soboon.service.ReportService;
import com.semiproject.soboon.vo.MemberVO;
import com.semiproject.soboon.vo.PagingVO;
import com.semiproject.soboon.vo.ReportVO;

@RestController
@RequestMapping("/")
public class AdminController {

	@Inject
	MemberService service;
	@Inject
	ReportService reportservice;
	
	@GetMapping("admin")
	public ModelAndView admin(PagingVO pVO) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/admin_page");
		return mav;
	}
	
	@GetMapping("admin/memberMgr")
	public Map<String, Object> adminMgr(PagingVO pVO) {
		
		pVO.setRecordPerPage(12); // 한번에 출력할 리스트수
		Map<String, Object> map=new HashMap<>();
		//전체 회원수 가져오기
		int cnt = service.getMembercnt();
		pVO.setTotalRecord(cnt);
		//페이지에 해당하는 회원 목록
		List<MemberVO> list=service.memberList(pVO);		
		
		map.put("cnt", cnt);
		/* map.put("pVO", pVO); */
		map.put("userList", list);
		map.put("paging", pVO);
		return map;
	}
	
	@GetMapping("admin/reportMgr")
	public Map<String, Object> reportMgr(PagingVO pVO) {

		pVO.setRecordPerPage(12); // 한번에 출력할 리스트수
		Map<String, Object> map=new HashMap<>();
		//전체 리포트 가져오기
		int cnt = reportservice.getReportcnt();
		/* System.out.println(cnt); */
		pVO.setTotalRecord(cnt);
		//리포트에 해당하는 리포트 목록
		List<ReportVO> list=reportservice.ReportList(pVO);
		
		map.put("cnt", cnt);
		/* map.put("pVO", pVO); */
		map.put("reportList", list);
		map.put("paging", pVO);
		return map;
	}
	
	@GetMapping("admin/multiDel")
	public ModelAndView ReportMultiDelete(ReportVO vo, boolean fake, HttpSession session) {
		

		/* vo.setReporter((String)session.getAttribute("logId")); */
		/* System.out.println(vo.getReporter()); */
	System.out.println(vo.getNoList().size());
		
		if(fake) { 
			reportservice.ReportMultiDelete(vo); 
		}else { //board목록 삭제
			//신고횟수 증가
			service.updateWarn(vo);
			//레코드 지우기
			reportservice.delreport(vo); 
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/admin");
		return mav;
	}
}