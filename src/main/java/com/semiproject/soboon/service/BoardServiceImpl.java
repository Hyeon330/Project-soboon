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
	public int shareAndReqInsert(BoardVO vo) {
		return dao.shareAndReqInsert(vo);
	}

	@Override
	public List<BoardVO> selectList(String category, PagingVO pvo) {
		return dao.selectList(category, pvo);
	}

	@Override
	public int selectTotalRecord(String category, PagingVO pvo) {
		return dao.selectTotalRecord(category, pvo);
	}
	
	@Override
	public BoardVO selectCategory(String category) {
		return dao.selectCategory(category);
	}

	@Override
	public Map<MemberVO, BoardVO> selectView(int no, String category) {
		return dao.selectView(no, category);
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
	public BoardVO selectEditView(int no, String category) {
		return dao.selectEditView(no, category);
	}
	
	@Override
	public int updateEditView(BoardVO vo) {
		return dao.updateEditView(vo);
	}
	
	@Override
	public int deleteView(int no, String category, String userid) {
		return dao.deleteView(no, category, userid);
	}
	
	@Override
	public int insertJoin(JoinVO vo) {
		return dao.insertJoin(vo);
	}
	
	@Override
	public int updateJoinPlus(BoardVO vo) {
		return dao.updateJoinPlus(vo);
	}

	@Override
	public BoardVO selectJoin(BoardVO vo) {
		return dao.selectJoin(vo);
	}










}
