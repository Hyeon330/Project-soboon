package com.semiproject.soboon.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.semiproject.soboon.vo.AdminajaxVO;

@RestController
public class AdminController {

	@GetMapping("/admin")
	public ModelAndView admin() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_page");
		return mav;
	}
	@GetMapping("/admin/memberMgr")
	public List<AdminajaxVO> memberMgr(Model m) {	//vo 재설정
		List<AdminajaxVO> arr=new ArrayList<>();
		
		arr.add(new AdminajaxVO(13, "초코바", 20000, 3));
		return arr;
	}
	@GetMapping("/admin/reportMgr")
	public List<AdminajaxVO> reportMgr(Model m) {	//vo 재설정
		List<AdminajaxVO> arr=new ArrayList<>();
		
		arr.add(new AdminajaxVO(13, "아이스크림", 12000, 3));
		return arr;
	}
}