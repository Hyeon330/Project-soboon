package com.semiproject.soboon.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.semiproject.soboon.dao.BoardDAO;
import com.semiproject.soboon.vo.BoardVO;
import com.semiproject.soboon.vo.JoinVO;
import com.semiproject.soboon.vo.MemberVO;
import com.semiproject.soboon.vo.PagingVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO dao;

	@Override
	public int boardInsert(BoardVO vo) {
		return dao.boardInsert(vo);
	}

	@Override
	public List<BoardVO> selectList(PagingVO pvo) {
		return dao.selectList(pvo);
	}

	@Override
	public int selectTotalRecord(PagingVO pvo) {
		return dao.selectTotalRecord(pvo);
	}
	
	@Override
	public BoardVO selectCategory(String category) {
		return dao.selectCategory(category);
	}

	@Override
	public BoardVO selectView(int no) {
		return dao.selectView(no);
	}

	@Override
	public void updateViews(int no) {
		dao.updateViews(no);
	}

	@Override
	public BoardVO getFileName(int no) {
		return dao.getFileName(no);
	}
	
	@Override
	public BoardVO selectEditView(int no) {
		return dao.selectEditView(no);
	}
	
	@Override
	public int updateEditView(BoardVO vo) {
		return dao.updateEditView(vo);
	}
	
	@Override
	public int deleteView(int no, String userid) {
		return dao.deleteView(no, userid);
	}











}
