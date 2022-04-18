package com.semiproject.soboon.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.semiproject.soboon.vo.myPagingVO;


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
//				BoardVO fileVO = service.getFileName(no);
				int result = service.delMember(userid);
				if(result>0) {//회원 삭제 완료
//					RelateUploadFile.fileDelete(path, fileVO.getThumbnailImg());
//					RelateUploadFile.fileDelete(path, fileVO.getImg1());
//					RelateUploadFile.fileDelete(path, fileVO.getImg2());
//					RelateUploadFile.fileDelete(path, fileVO.getImg3());					
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
	public Map<String, Object> mypost(myPagingVO pVO, HttpSession session) {
		String userid = (String) session.getAttribute("logId");
		System.out.println("pVO.onePageRecord ---->" + pVO.getOnePageRecord());
		Map<String, Object> map = new HashMap<String, Object>();
		// 현재 로그인된 아이디가 쓴 게시글 수 가져오기
		pVO.setTotalRecord(service.mypostCount(userid));
		System.out.println("pVO.totalReocrd--->"+pVO.getTotalRecord());
		
		// 페이지에 해당하는 로그인된 회원이 쓴 게시글 목록
		List<BoardVO> list = service.mypostList(userid, pVO);
		map.put("pVO", pVO);
		map.put("plist", list);
		return map;	
	}
	
	@PostMapping("multiDel")
	@ResponseBody
	public int mypostMultiDelete(BoardVO vo, HttpSession session) {
		vo.setUserid((String)session.getAttribute("logId"));
		int result = service.mypostMultiDelete(vo);
		return  result;
	}
}//controller


