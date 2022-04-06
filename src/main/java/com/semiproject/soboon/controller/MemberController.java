package com.semiproject.soboon.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.semiproject.soboon.service.MemberService;
import com.semiproject.soboon.vo.MemberVO;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Inject
	MemberService service;
	
	@GetMapping("signup")
	public String memberForm() {
		return "member/signup";
	}
	
	//회원등록
	@PostMapping("memberOk")
	public String memberFormOk(MemberVO vo, Model model) {
		int cnt = service.memberInsert(vo);
		
		model.addAttribute("cnt", cnt);
		
		return "member/signup_success";
	}
}
