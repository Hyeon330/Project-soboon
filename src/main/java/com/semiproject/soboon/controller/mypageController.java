package com.semiproject.soboon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class mypageController {
	@GetMapping("/mypage")
	public String myPage() {
		return "mypage/mypageEditForm";
	}
	@GetMapping("/mypageEdit")
	public ModelAndView mypageEdit() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("mypage/mypageEditForm");
		
		return mav;
	}
	
}//controller


