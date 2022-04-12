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
		String myNickname = (String)session.getAttribute("nickName");
		
		List<ChatVO> dbMsgList = service.getLastMessage(myNickname);
		
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
	
	@PostMapping("getAllMessage")
	public List<ChatVO> getAllMessage(String oppNickname, HttpSession session){
		System.out.println(oppNickname);
		System.out.println((String)session.getAttribute("nickName"));
		return service.getAllMessage((String)session.getAttribute("nickName"), oppNickname);
	}
}
