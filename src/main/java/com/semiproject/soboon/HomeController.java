package com.semiproject.soboon;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.semiproject.soboon.service.HomeService;

@Controller
public class HomeController {
	@Inject
	HomeService service;
	
	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", service.selectList());
		mav.setViewName("home");
		return mav;
	}
	
	@GetMapping("/areaSelect")
	public ModelAndView areaSelectForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("areaSelect");
		return mav;
	}
}

