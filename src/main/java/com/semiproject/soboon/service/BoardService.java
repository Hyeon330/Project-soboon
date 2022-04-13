package com.semiproject.soboon.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.semiproject.soboon.vo.BoardVO;
import com.semiproject.soboon.vo.JoinVO;
import com.semiproject.soboon.vo.MemberVO;
import com.semiproject.soboon.vo.PagingVO;

public interface BoardService {

	// 나눔,요청 글 등록
	public int shareAndReqInsert(BoardVO vo);
	
	// 글 리스트 보이기
	public List<BoardVO> selectList(String category, PagingVO pvo);
	
	// 게시판의 레코드 개수 가져오기(페이징)
	public int selectTotalRecord(String category, PagingVO pvo);
	
	// 카테고리 가져오기
	public BoardVO selectCategory(String category);
	
	// 나눔,요청 상세페이지(뷰)
	public Map<MemberVO, BoardVO> selectView(int no, String category);
	
	// 조회수 증가
	public void updateViews(int no);
	
	// 상세페이지를 수정,삭제할 때 필요한 파일명 구하기
	public BoardVO getFileName(int no);
	
	// 나눔, 요청 상세페이지 수정 폼
	public BoardVO selectEditView(int no, String category);
	
	// 나눔, 요청 상세페이지 수정 DB연결
	public int updateEditView(BoardVO vo);
	
	// 상세페이지 삭제 
	public int deleteView(int no, String category, String userid);
	
	// 참여인원 등록
	public int insertJoin(JoinVO vo);
	
	// 참여인원 수 증가
	public int updateJoinPlus(BoardVO vo);
	
	// 참여인원 수 보이기
	public BoardVO selectJoin(BoardVO vo);
}