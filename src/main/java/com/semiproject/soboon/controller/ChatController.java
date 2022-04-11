package com.semiproject.soboon.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.semiproject.soboon.service.ChatService;
import com.semiproject.soboon.vo.ChatVO;

@RestController
@RequestMapping("/chat/")
public class ChatController {
	
	@Inject
	ChatService service;

	@GetMapping("getLastMessage")
	public List<ChatVO> getMessage(HttpSession session) {
		List<ChatVO> resultList = new ArrayList<ChatVO>();
		Set<String> oppNickNameSet = new HashSet<String>();
		
		List<ChatVO> dbMsgList = service.getLastMessage((String)session.getAttribute("logId"));
		
		for (ChatVO vo : dbMsgList) {
			String oppNickName = "";
			if(vo.getR_nickname().equals((String)session.getAttribute("nickName"))) {
				oppNickName = vo.getS_nickname();
			} else {
				oppNickName = vo.getR_nickname();
			}
			if(!oppNickNameSet.contains(oppNickName)) {
				oppNickNameSet.add(oppNickName);
				resultList.add(vo);
			}
		}
		
		return resultList;
	}
	
	@PostMapping("getAllMessage")
	public List<ChatVO> getAllMessage(String oppNickname, HttpSession session){
		String myId = (String)session.getAttribute("logId");
		List<ChatVO> list = service.getAllMessage(myId, oppNickname);
		
		for (ChatVO chatVO : list) {
			if(chatVO.getSender().equals(myId)) {
				chatVO.setS_nickname((String)session.getAttribute("nickName"));
				chatVO.setR_nickname(oppNickname);
			} else {
				chatVO.setS_nickname(oppNickname);
				chatVO.setR_nickname((String)session.getAttribute("nickName"));
			}
		}
		
		return list;
	}
}
