package com.semiproject.soboon.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/mypage/")
@Controller
public class mypageController {
	// 개인정보수정 페이지 이동
	@GetMapping("editForm")
	public String myPageEdit(HttpServletRequest request) {
		System.out.println(request.getParameter("pageName"));
		return "mypage/mypageEditForm";
	}
	
}//controller


