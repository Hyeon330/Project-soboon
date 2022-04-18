package com.semiproject.soboon.controller;

import java.util.*;

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
	public List<ChatVO> getLastMessage(HttpSession session) {
		String myNickname = (String)session.getAttribute("nickName");
		return lastMessage(service.getLastMessage(myNickname), myNickname);
	}
	
	@PostMapping("getAllMessage")
	public List<ChatVO> getAllMessage(String oppNickname, HttpSession session){
		service.updateChatRead((String)session.getAttribute("nickName"));
		return service.getAllMessage((String)session.getAttribute("nickName"), oppNickname);
	}
	
	@PostMapping("updateChatRead")
	public void updateChatRead(HttpSession session) {
		service.updateChatRead((String)session.getAttribute("nickName"));
	}
	
	@PostMapping("searchNickname")
	public List<ChatVO> searchNickname(String nickNameKeyword, HttpSession session) {
		String myNickname = (String)session.getAttribute("nickName");
		return lastMessage(service.getLastMessage((String)session.getAttribute("nickName"), nickNameKeyword), myNickname);
	}
	
	List<ChatVO> lastMessage(List<ChatVO> dbMsgList, String myNickname){
		List<ChatVO> resultList = new ArrayList<ChatVO>();
		Set<String> oppNickNameSet = new HashSet<String>();
		for (ChatVO vo : dbMsgList) {
			String oppNickName = "";
			if(vo.getSender().equals(myNickname)) {
				oppNickName = vo.getReceiver();
			} else {
				oppNickName = vo.getSender();
			}
			if(!oppNickNameSet.contains(oppNickName)) {
				oppNickNameSet.add(oppNickName);
				resultList.add(vo);
			}
		}
		return resultList;
	}
}
