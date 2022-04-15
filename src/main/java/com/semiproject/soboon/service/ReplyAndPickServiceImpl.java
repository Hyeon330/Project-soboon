package com.semiproject.soboon.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.semiproject.soboon.dao.ReplyAndPickDAO;
import com.semiproject.soboon.vo.BoardVO;
import com.semiproject.soboon.vo.PickVO;
import com.semiproject.soboon.vo.ReplyVO;

@Service
public class ReplyAndPickServiceImpl implements ReplyAndPickService {

	@Inject
	ReplyAndPickDAO dao;
	
	@Override
	public int insertReply(ReplyVO vo) {
		return dao.insertReply(vo);
	}

	@Override
	public List<ReplyVO> selectReplyList(int no) {
		return dao.selectReplyList(no);
	}

	@Override
	public int updateReply(ReplyVO vo) {
		return dao.updateReply(vo);
	}

	@Override
	public int deleteReply(int replyno, String nickname) {
		return dao.deleteReply(replyno, nickname);
	}

	@Override
	public int insertPick(int no, String userid) {
		return dao.insertPick(no, userid);
	}

	@Override
	public int updateBoardPick(int no) {
		return dao.updateBoardPick(no);
	}
	
	

}
