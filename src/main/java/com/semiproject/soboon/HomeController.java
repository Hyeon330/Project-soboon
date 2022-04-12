package com.semiproject.soboon;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	@GetMapping("/")
	public String home(HttpSession session) {
		System.out.println(session.getAttribute("logId"));
		return "home";
	}
	
	@GetMapping("/areaSelect")
	public ModelAndView areaSelectForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("areaSelect");
		return mav;
	}
}

