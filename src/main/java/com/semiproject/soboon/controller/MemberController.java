package com.semiproject.soboon.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
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
	@Autowired
	JavaMailSender javaMailSender;
	
	@GetMapping("signup")
	public String memberForm(HttpSession session) {
		session.invalidate();
		return "member/signup";
	}
	
	//회원등록
	@PostMapping("memberOk")
	public String memberFormOk(MemberVO vo, Model model, HttpSession session) {
		int cnt = 0;
		if(session.getAttribute("kakao")==null) {
			cnt = service.memberInsert(vo);
		}else {
			vo.setUserid((String)session.getAttribute("logId"));
			vo.setUsername((String)session.getAttribute("logName"));
			cnt = service.memberInsert(vo);
		}
		
		model.addAttribute("cnt", cnt);
		
		return "member/signup_success";
	}
	
	//로그인폼가기
	@GetMapping("login")
	public String loginForm() {
		return "member/login";
	}
	
	//로그인
	@PostMapping("loginOk")
	public ResponseEntity<String> loginOk(MemberVO vo, HttpSession session, HttpServletResponse res) {
		ResponseEntity<String> entity = null;
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");
		
		MemberVO vo2 = service.loginCheck(vo);
		if (vo2 != null) {
			session.setAttribute("logId", vo2.getUserid());
			session.setAttribute("logName", vo2.getUsername());
			session.setAttribute("nickName", vo2.getNickname());
			session.setAttribute("logAdmin", vo2.getVerify());
			session.setAttribute("logStatus", "Y");
			setSessionAddr(vo2, session);
			
			setCookie(res, session);
			
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
	public ModelAndView logout(HttpSession session, HttpServletRequest req, HttpServletResponse res) {
		session.invalidate();
		
		delCookies(req, res);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
	
	//=========================================================================
	//카카오톡관련
	//카카오톡 로그인
	@GetMapping("kakao")
	public String login(@RequestParam("code") String code, HttpSession session, RedirectAttributes attr, HttpServletResponse res) {
		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
		
//		// 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
		
		MemberVO vo = new MemberVO();
		vo.setUserid((String) userInfo.get("email"));
		MemberVO loginVO= service.loginCheck(vo);
		if(loginVO != null) {
			session.setAttribute("logId", loginVO.getUserid());
			session.setAttribute("logName", loginVO.getUsername());
			session.setAttribute("nickName", loginVO.getNickname());
			session.setAttribute("logAdmin", loginVO.getVerify());
			session.setAttribute("kakao", "Y");
			session.setAttribute("logStatus", "Y");
			setSessionAddr(loginVO, session);
			setCookie(res, session);
			return "redirect:/";
		}else {
			session.setAttribute("logId", (String) userInfo.get("email"));
			session.setAttribute("logName", (String) userInfo.get("nickname"));
			session.setAttribute("kakao", "Y");
			return "member/signup";
		}
	}
	
	//카카오톡 로그아웃
	@RequestMapping(value="logout")
	public String klogout(HttpSession session, HttpServletRequest req, HttpServletResponse res) {
		kakao.kakaoLogout((String)session.getAttribute("access_Token"));
		session.invalidate();
		delCookies(req, res);

		return "redirect:/";
	}
	
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
	
	//---------------------------------------------------------------------
	//아이디/비밀번호 찾기 폼으로 이동
	@GetMapping("search_info")
	public String search_info() {
		return "/member/search_info";
	}
	
	//아이디찾기(휴대폰번호로)
	@PostMapping("searchid_tel")
	@ResponseBody
	public String searchid_tel(String username,String tel) {
		String result = service.searchid_tel(username, tel);
		
		return result;
	}
	
	//아이디찾기(이메일로)
	@PostMapping("searchid_email")
	@ResponseBody
	public String searchid_email(String username, String email) {
		String result = service.searchid_email(username,email);
		return result;
	}
	
	//비밀번호찾기(이메일로 임시 비밀번호 보내기)
	@PostMapping("sendemail")
	@ResponseBody
	public String sendEmail(MemberVO vo, HttpSession session) {
		MemberVO vo2 = service.readMember(vo.getUserid());
		
		if(vo2 == null) {
			return "fail";
		}
		if(vo2.getEmail().equals(vo.getEmail())) {
			
			Random random = new Random();
			String key = ""; // 인증번호

			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(vo.getEmail()); // 스크립트에서 보낸 메일을 받을 사용자 이메일 주소

			// 입력키를 위한 코드
			for (int i = 0; i < 4; i++) {
				int idx = random.nextInt(25) + 65; // A~Z까지 랜덤 알파벳 생성
				key += (char) idx; // 4자리 랜덤 정수를 생성
			}
			int numIdx = random.nextInt(9999) + 1000; // 4자리 랜덤 정수를 생성
			key += numIdx;

			message.setSubject("소분소분 임시 비밀번호 보냅니다.");
			message.setText("임시비밀번호는 " + key + "입니다. 로그인 후 비밀번호 변경을 해주세요.");
			
			vo2.setUserpwd(key);
			service.updatePwd(vo2);
			
			javaMailSender.send(message);
			
			return "success";
		}else {
			return "fail";
		}
	}
	
	//---------------------------------------------------------------------
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
	
	@PostMapping("updateMyAddr")
	@ResponseBody
	public void updateMyAddr(MemberVO vo, HttpSession session, HttpServletResponse res) {
		vo.setUserid((String)session.getAttribute("logId"));
		setSessionAddr(vo, session);
		service.updateMyAddr(vo);
		setCookie(res, session);
	}
	
	// 세션에 주소를 넣어주는 함수
	void setSessionAddr(MemberVO vo, HttpSession session) {
		session.setAttribute("addrLarge", vo.getLarge());
		session.setAttribute("addrMedium", vo.getMedium());
		session.setAttribute("addrSmall", vo.getSmall());
	}
	
	// 쿠키 생성
	void setCookie(HttpServletResponse res, HttpSession session) {
		Iterator<String> it = session.getAttributeNames().asIterator();
		while(it.hasNext()) {
			String sessionAttributeName = it.next();
			Cookie c = null;
			if(sessionAttributeName.equals("logAdmin")) {
				c = new Cookie(sessionAttributeName, ((Integer) session.getAttribute(sessionAttributeName)).toString());
			}else {
				c = new Cookie(sessionAttributeName, (String) session.getAttribute(sessionAttributeName));
			}
			c.setMaxAge(60*60*24*30);
			c.setPath("/");
			res.addCookie(c);
		}
	}
	
	// 쿠키 삭제
	void delCookies(HttpServletRequest req, HttpServletResponse res) {
		Cookie[] cookies = req.getCookies();
		if(cookies != null) {
			for (Cookie cookie : cookies) {
				cookie.setMaxAge(0);
				cookie.setPath("/");
				res.addCookie(cookie);
			}
		}
	}
}
