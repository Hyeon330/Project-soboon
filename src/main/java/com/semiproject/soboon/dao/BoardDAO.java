package com.semiproject.soboon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.semiproject.soboon.vo.BoardVO;
import com.semiproject.soboon.vo.JoinVO;
import com.semiproject.soboon.vo.MemberVO;

@Mapper 
@Repository
public interface BoardDAO {

	// 나눔,요청 글 등록
	public int shareAndReqInsert(BoardVO vo); 
	
	// 글 리스트 보이기
	public List<BoardVO> selectList(String category);
	
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
