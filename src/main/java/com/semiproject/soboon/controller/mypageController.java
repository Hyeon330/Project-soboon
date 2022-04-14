package com.semiproject.soboon.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.semiproject.soboon.service.EditService;
import com.semiproject.soboon.vo.BoardVO;
import com.semiproject.soboon.vo.MemberVO;
import com.semiproject.soboon.vo.MypagePagingVO;

@RequestMapping("/mypage/")
@Controller
public class mypageController {
	@Inject
	EditService service;
	
	// 개인정보수정 페이지 이동
	@GetMapping("editForm")
	public ModelAndView myPageEdit(HttpSession session, HttpServletRequest request) {
		String userid = (String)session.getAttribute("logId");
		MemberVO vo = service.selectEdit(userid);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("VO", vo);
		System.out.println("param.pageName--->"+request.getParameter("pageName"));
		mav.setViewName("mypage/mypageEditForm");
		return mav;
	}
	
	@PostMapping("nicknameCheck")
	@ResponseBody
	public int nicknameCheck(String nickname) {
		int cnt = service.nicknameCheck(nickname);
		return cnt;
	}
	@PostMapping("mypageEditOk")
	public ResponseEntity<String> mypageEditOk(MemberVO vo, HttpSession session) {
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html;charset=utf-8");
		try {
			int result = service.editUpdate(vo);
			if(result>0) {//수정성공
				String msg = "<script>alert('회원정보수정이 성공하였습니다.'); history.back();</script>";
				entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
			}else {//수정실패
				String msg = "<script>alert('회원정보수정이 실패하였습니다.'); history.back();</script>";
				entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {//수정오류
			System.out.println("회원 정보 수정 중에 오류 발쌩!!!");
			String msg = "<script>alert('회원정보수정중 오류발생하였습니다.'); history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;	
	}
	// 마이페이지 회원탈퇴창으로 이동
	@GetMapping("delMember")
	public ModelAndView delMember(MemberVO vo, HttpSession session) {
		String userid = (String)session.getAttribute("logId");
		vo = service.selectEdit(userid);
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", vo);
		mav.setViewName("mypage/mypageDelMember");
		return mav;
	}
	@PostMapping("delMemberOk")
	public ResponseEntity<String> delMemberOk(String pwdForCheck,HttpSession session) {
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html;charset=utf-8");
		String userid = (String) session.getAttribute("logId");
		try {
				int result = service.delMember(userid);
				if(result>0) {//회원 삭제 완료
					session.invalidate();
					String msg = "<script>alert('회원 삭제를 성공했습니다.\\n홈페이지로 이동합니다.');location.href='/';</script>";
					entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
				}else {// 회원 삭제 실패
					String msg = "<script>alert('회원 삭제를 실패했습니다.\\n회원탈퇴창으로 돌아갑니다.');history.back();</script>";
					entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
				}
		} catch (Exception e) {// 회원 삭제 실패
			String msg = "<script>alert('회원 삭제 도중  오류가 발생했습니다.\\n회원탈퇴창으로 돌아갑니다.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;		
	}
	
	@GetMapping("showView")
	public ModelAndView mypageView(HttpSession session) {
		String userid = (String) session.getAttribute("logId");
		int pCnt = service.mypostCount(userid);
		int rCnt = service.myreplyCount(userid);
		ModelAndView mav = new ModelAndView();
		mav.addObject("mpCnt", pCnt);
		mav.addObject("mrCnt", rCnt);
		mav.setViewName("mypage/mypageView");
		return mav;
	}
	@GetMapping("mypost")
	@ResponseBody
	public List<BoardVO> mypost(MypagePagingVO pVO, HttpSession session) {
		String userid = (String) session.getAttribute("logId"); 
		System.out.println(userid);
		List<BoardVO> list = service.mypostList(userid, pVO);
		return list;
		
	}
}//controller


