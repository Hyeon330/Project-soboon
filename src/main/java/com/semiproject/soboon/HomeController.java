package com.semiproject.soboon;
import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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
	public ModelAndView home(BoardVO vo, HttpSession session, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		Cookie[] c = req.getCookies();
		if(c != null) {
			for (Cookie cookie : c) {
				session.setAttribute(cookie.getName(), cookie.getValue());
			}
		}
		
		vo.setSmall((String)session.getAttribute("addrSmall"));
		mav.addObject("list", service.selectList(vo));
		mav.setViewName("home");
		
		return mav;
	}

}