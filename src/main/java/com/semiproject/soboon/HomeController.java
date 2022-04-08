package com.semiproject.soboon;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/")
	public String home(HttpSession session) {
		session.setAttribute("logStatus", "Y");
		session.setAttribute("userid", "jihyang123");
		session.setAttribute("nickname", "이쟝");
		session.setAttribute("address", "서울 강동구");
		return "home";
	}
}
