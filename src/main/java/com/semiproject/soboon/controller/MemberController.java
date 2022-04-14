package com.semiproject.soboon.controller;

import java.util.HashMap;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.semiproject.soboon.service.AddressService;
import com.semiproject.soboon.service.KakaoAPI;
import com.semiproject.soboon.service.MemberService;
import com.semiproject.soboon.vo.MemberVO;

@Controller
@RequestMapping("/member/")
public class MemberController {
	
	@Inject
	MemberService service;
	@Autowired
	KakaoAPI kakao;
	@Inject
	AddressService serviceAddr;
	
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
		headers.add("Content-Type", "text/html; charset=utf-8");
		
		MemberVO vo2 = service.loginCheck(vo);
		if (vo2 != null) {
			session.setAttribute("logId", vo2.getUserid());
			session.setAttribute("logName", vo2.getUsername());
			session.setAttribute("nickName", vo2.getNickname());
			session.setAttribute("logStatus", "Y");
			session.setAttribute("logAdmin", vo2.getVerify());
			String msg = "<script>location.href='/';</script>";
			
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
			
		} else {
			String msg = "<script>alert('로그인에 실패하였습니다.\\n아이디와 비밀번호를 다시 확인해주세요.'); history.back(-1);</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

	//로그아웃
	@GetMapping("logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
	
	//=========================================================================
	//카카오톡관련
	//카카오톡 로그인
	@RequestMapping(value="kakao/klogin")
	public String login(@RequestParam("code") String code, HttpSession session, RedirectAttributes attr) {
		
		String access_Token = kakao.getAccessToken(code);
//		System.out.println("controller access_token:" + access_Token);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		System.out.println("login Controller: " + userInfo);
		
//		// 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
//		System.out.println(kakao.getUserInfo("email"));
		if(userInfo.get("email") != null) {
			
			session.setAttribute("logId", userInfo.get("email"));
			session.setAttribute("access_Token", access_Token);
			session.setAttribute("logStatus", "Y");
			session.setAttribute("userInfo", userInfo);
		}
		attr.addFlashAttribute("code",access_Token);
		
		System.out.println(session.getAttribute("logStatus"));
		return "redirect:/?code="+access_Token;
	}
	
	//카카오톡 로그아웃
	@RequestMapping(value="logout")
	public String klogout(HttpSession session) {
		kakao.kakaoLogout((String)session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("logId");
		session.removeAttribute("logStatus");

		return "redirect:/";
	}
	
	//카카오톡 연동 정보 조회+DB에 회원 정보 넣기
	@RequestMapping(value="selectMyAccessToken")
	public String oauthKakao(@RequestParam(value="code",required=false) String code, HttpServletRequest req) throws Exception{
		System.out.println("카카오 정보 조회 들어옴");
		
		//발급받은 인가코드를 통해 토큰 발급받기
//		String access_Token =kakao.getAccessToken(code);
//		System.out.println("access_Token: " + access_Token);
		HttpSession session = req.getSession();
		
		HashMap<String, Object> userInfo = (HashMap<String,Object>)session.getAttribute("userInfo");
		MemberVO kakaoVO = new MemberVO();
		String kakao_email = (String)userInfo.get("email");
		String kakao_nickname = (String)userInfo.get("nickname");
		
//		System.out.println("nickname= " + kakao_nickname);
		
//		int cnt = service.emailCheck(kakao_email);
//		System.out.println(cnt);
		if(service.emailCheck(kakao_email)<=0) {
//			System.out.println("유저 회원가입");
			kakaoVO.setUserid(kakao_email);
			kakaoVO.setUserpwd("00000000");
			kakaoVO.setUsername(kakao_nickname);
			kakaoVO.setNickname(kakao_nickname);
			kakaoVO.setLarge("");
			kakaoVO.setMedium("");
			kakaoVO.setSmall("");
			kakaoVO.setTel("010-1111-1111");
			kakaoVO.setEmail(kakao_email);
			service.memberInsert(kakaoVO);
		}
		
		session.setAttribute("logId", kakao_email);
		
		return "redirect:/";
	}
	//=========================================================================
	
	//SMS인증번호
	@GetMapping("memberTelCheck")
	@ResponseBody
	public String sendSMS(String tel) {
		//5자리 인증번호 만들기
		Random random = new Random();
		String numStr = "";
		for(int i=0; i < 5; i++) {
			String ranNum = Integer.toString(random.nextInt(10));
			numStr += ranNum;
		} 
		//문자보내기
		service.telCheck(tel, numStr);
		return numStr;
	}
	
	//아이디/비밀번호 찾기 폼으로 이동
	@GetMapping("search_info")
	public String search_info() {
		return "/member/search_info";
	}
	
	//아이디찾기
	//핸드폰번호로
	@PostMapping("search_info")
	@ResponseBody
	public String useridSearch_tel(@RequestParam("username") String username, @RequestParam("tel") String tel) {
		String result = service.searchid_tel(username,tel);
		return result;
	}
	
	//이메일로
//	@PostMapping("/search_info")
//	@ResponseBody
//	public String useridSearch_email(@RequestParam("searchinfo-email") String username, @RequestParam() String email) {
//		String result = service.searchid_email(username,email);
//		return result;
//	}

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
	
	@PostMapping("memberEmailCheck")
	@ResponseBody
	public int emailCheck(String email) {
		int cnt = service.emailCheck(email);
		return cnt;
	}
}
