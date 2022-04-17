package com.semiproject.soboon.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.semiproject.soboon.dao.BoardDAO;
import com.semiproject.soboon.vo.BoardVO;
import com.semiproject.soboon.vo.PagingVO;
import com.semiproject.soboon.vo.PickVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO dao;

	@Override
	public int boardInsert(BoardVO vo) {
		return dao.boardInsert(vo);
	}

	@Override
	public List<BoardVO> selectList(PagingVO pvo, BoardVO vo) {
		return dao.selectList(pvo, vo);
	}

	@Override
	public int selectTotalRecord(PagingVO pvo) {
		return dao.selectTotalRecord(pvo);
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
	
	@Override
	public int insertPick(int no, String userid) {
		return dao.insertPick(no, userid);
	}

	@Override
	public int plusBoardPick(int no) {
		return dao.plusBoardPick(no);
	}

	@Override
	public int deletePick(int no, String userid) {
		return dao.deletePick(no, userid);
	}

	@Override
	public int minusBoardPick(int no) {
		return dao.minusBoardPick(no);
	}
	
	@Override
	public PickVO selectAlreadyPick(int no, String userid) {
		return dao.selectAlreadyPick(no, userid);
	}

	










}
