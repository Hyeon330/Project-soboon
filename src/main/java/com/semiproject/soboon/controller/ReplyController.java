package com.semiproject.soboon.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.semiproject.soboon.service.ReplyService;
import com.semiproject.soboon.vo.ReplyVO;

@RestController
@RequestMapping("/reply/")
public class ReplyController {
	
	@Inject
	ReplyService service;
	
	// 댓글 등록하기
	@PostMapping("writeOk")
	public int writeOk(ReplyVO vo, HttpSession session) {
		vo.setUserid((String)session.getAttribute("logId"));
		vo.setNickname((String)session.getAttribute("nickName"));
		return service.insertReply(vo);
	}
	
	// 댓글 목록보이기
	@GetMapping("replyList")
	public List<ReplyVO> replyList(int no){
		return service.selectReplyList(no);
	}
	
	// 댓글 수정하기
	@PostMapping("editOk")
	public int updateReply(ReplyVO vo, HttpSession session) {
		vo.setNickname((String)session.getAttribute("nickName"));
		return service.updateReply(vo);
	}
	
	//댓글 삭제하기
	@GetMapping("delOk")
	public int deleteReply(int replyno, HttpSession session) {
		return service.deleteReply(replyno, (String)session.getAttribute("nickName"));
	}
	
}
