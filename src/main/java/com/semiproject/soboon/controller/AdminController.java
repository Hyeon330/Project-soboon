package com.semiproject.soboon.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.semiproject.soboon.service.MemberService;
import com.semiproject.soboon.vo.PagingVO;

@RestController
@RequestMapping("/")
public class AdminController {

	@Inject
	MemberService service;
	
	@GetMapping("admin")
	public ModelAndView admin(PagingVO pVO) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/admin_page");
		return mav;
	}
}