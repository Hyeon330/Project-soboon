package com.semiproject.soboon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class mypageController {
	@GetMapping("/mypage")
	public String myPage() {
		return "mypage/mypage_home";
	}
}
