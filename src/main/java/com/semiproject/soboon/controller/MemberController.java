package com.semiproject.soboon.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	
	//로그인폼가기
	@GetMapping("login")
	public ModelAndView loginForm() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		return mav;
	}
	
	//로그인
	@PostMapping("loginOk")
	public ResponseEntity<String> loginOk(MemberVO vo, HttpSession session) {
		ResponseEntity<String> entity = null;
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charest=utf-8");
		
		try {
			MemberVO vo2 = service.loginCheck(vo);
			if(vo2!=null) {
				session.setAttribute("logId", vo2.getUserid());
				session.setAttribute("logName", vo2.getUsername());
				session.setAttribute("logStatus","Y");
				String msg = "<script>location.href='/';</script>";
				
				entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
			} else {
				throw new Exception();	
			}
		}catch(Exception e) {
			e.printStackTrace();
			
			String msg = "<script>alert('로그인에 실패하였습니다.\n로그인 폼으로 돌아갑니다.'); history.back(-1);</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@PostMapping("memberIdCheck")
	@ResponseBody
	public int idCheck(String userid) {
		int cnt = service.idCheck(userid);
		return cnt;
	}
	
	@PostMapping("memberNicknameCheck")
	@ResponseBody
	public int nicknameCheck(String nickname) {
		int cnt = service.nicknameCheck(nickname);
		return cnt;
	}
}
