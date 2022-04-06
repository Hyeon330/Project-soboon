package com.semiproject.soboon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@GetMapping("signup")
	public String memberForm() {
		return "member/signup";
	}
}
