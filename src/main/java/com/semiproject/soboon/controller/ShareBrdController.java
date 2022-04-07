package com.semiproject.soboon.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping("/shareBoard/")
@RestController
public class ShareBrdController {

	ModelAndView mav = new ModelAndView();
	
	@GetMapping("shareList")
	public ModelAndView shareForm() {
		mav.setViewName("shareBoard/shareList");
		return  mav;
	}
	
	@GetMapping("shareView")
	public ModelAndView shareView() {
		mav.setViewName("shareBoard/shareView");
		return mav;
	}
	
	@GetMapping("shareWrite")
	public ModelAndView shareWrite() {
		mav.setViewName("shareBoard/shareWrite");
		return mav;
	}
}
