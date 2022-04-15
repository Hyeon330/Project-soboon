package com.semiproject.soboon.service;

import java.util.List;

import com.semiproject.soboon.vo.BoardVO;
import com.semiproject.soboon.vo.HomeVO;
import com.semiproject.soboon.vo.PagingVO;

public interface HomeService {
	public List<HomeVO> selectList();
}
