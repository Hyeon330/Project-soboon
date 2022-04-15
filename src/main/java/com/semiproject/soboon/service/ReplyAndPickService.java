package com.semiproject.soboon.service;

import java.util.List;

import com.semiproject.soboon.vo.ReplyAndPickVO;

public interface ReplyAndPickService {

	// 댓글 등록하기
	public int insertReply(ReplyAndPickVO vo);
	
	// 댓글 목록보이기
	public List<ReplyAndPickVO> selectReplyList(int no);

	// 댓글 수정하기 
	public int updateReply(ReplyAndPickVO vo);
	
	// 댓글 삭제하기
	public int deleteReply(int replyno, String nickname);
	
}

