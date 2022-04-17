package com.semiproject.soboon;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.semiproject.soboon.service.HomeService;
import com.semiproject.soboon.vo.BoardVO;

@Controller
public class HomeController {
	@Inject
	HomeService service;
	
	@GetMapping("/")
	public ModelAndView home(BoardVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		vo.setSmall((String)session.getAttribute("addrSmall"));
		mav.addObject("list", service.selectList(vo));
		mav.setViewName("home");
		return mav;
	}
}
