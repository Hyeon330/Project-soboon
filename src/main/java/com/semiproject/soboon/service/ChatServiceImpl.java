package com.semiproject.soboon.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.semiproject.soboon.dao.ChatDAO;
import com.semiproject.soboon.vo.ChatVO;

@Service
public class ChatServiceImpl implements ChatService {

	@Inject
	ChatDAO dao;

	@Override
	public List<ChatVO> getLastMessage(String myNickname) {
		return dao.getLastMessage(myNickname);
	}
	
	@Override
	public List<ChatVO> getLastMessage(String myNickname, String nickNameKeyword) {
		return dao.getLastMessage(myNickname, nickNameKeyword);
	}

	@Override
	public List<ChatVO> getAllMessage(String myUserid, String oppNickname) {
		return dao.getAllMessage(myUserid, oppNickname);
	}

	@Override
	public int updateChatRead(String myNickname) {
		return dao.updateChatRead(myNickname);
	}	
}
