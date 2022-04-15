package com.semiproject.soboon.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.semiproject.soboon.dao.ReplyAndPickDAO;
import com.semiproject.soboon.vo.ReplyAndPickVO;

@Service
public class ReplyAndPickServiceImpl implements ReplyAndPickService {

	@Inject
	ReplyAndPickDAO dao;
	
	@Override
	public int insertReply(ReplyAndPickVO vo) {
		return dao.insertReply(vo);
	}

	@Override
	public List<ReplyAndPickVO> selectReplyList(int no) {
		return dao.selectReplyList(no);
	}

	@Override
	public int updateReply(ReplyAndPickVO vo) {
		return dao.updateReply(vo);
	}

	@Override
	public int deleteReply(int replyno, String nickname) {
		return dao.deleteReply(replyno, nickname);
	}

}
