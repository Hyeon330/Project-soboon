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
	public int boardInsert(BoardVO vo);
	
	// 글 리스트 보이기
	public List<BoardVO> selectList(PagingVO pvo);
	
	// 게시판의 레코드 개수 가져오기(페이징)
	public int selectTotalRecord(PagingVO pvo);
	
	// 카테고리 가져오기
	public BoardVO selectCategory(String category);
	
	// 나눔,요청 상세페이지(뷰)
	public BoardVO selectView(int no);
	
	// 조회수 증가
	public void updateViews(int no);
	
	// 상세페이지를 수정,삭제할 때 필요한 파일명 구하기
	public BoardVO getFileName(int no);
	
	// 상세페이지 수정 폼
	public BoardVO selectEditView(int no);
	
	// 상세페이지 수정 DB연결
	public int updateEditView(BoardVO vo);
	
	// 상세페이지 삭제 
	public int deleteView(int no, String userid);
	
}