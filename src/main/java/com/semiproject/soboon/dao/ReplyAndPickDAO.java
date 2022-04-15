package com.semiproject.soboon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.semiproject.soboon.vo.ReplyVO;

@Mapper
@Repository
public interface ReplyAndPickDAO {

	// 댓글 등록하기
	public int insertReply(ReplyVO vo);
	
	// 댓글 목록보이기
	public List<ReplyVO> selectReplyList(int no);

	// 댓글 수정하기 
	public int updateReply(ReplyVO vo);
	
	// 댓글 삭제하기
	public int deleteReply(int replyno, String nickname);
	
	// 찜하기 등록하기
	public int insertPick(int no, String userid);
	
	// 찜하기 등록 board DB 연결
	public int plusBoardPick(int no);
	
	// 찜하기 취소하기
	public int deletePick(int no, String userid);
	
	// 찜하기 취소 board DB 연결
	public int minusBoardPick(int no);
	
}
