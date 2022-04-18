package com.semiproject.soboon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.semiproject.soboon.vo.ReportVO;

@Mapper
@Repository
public interface ReportDAO {
		// 리스트보기
	public List<ReportVO> reportList(int no);
}
