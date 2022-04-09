package com.semiproject.soboon.controller;

import java.io.File;
import java.nio.charset.Charset;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.semiproject.soboon.RelateUploadImgFile;
import com.semiproject.soboon.service.BoardService;
import com.semiproject.soboon.vo.BoardVO;

@RequestMapping("/board/")
@RestController
public class BoardController {
	
	@Inject
	BoardService service;
	
	ModelAndView mav = new ModelAndView();
	ResponseEntity<String> entity = null;
	
	@GetMapping("shareAndReqList")
	public ModelAndView shareAndReqListForm(String category) {
		mav.addObject("list", service.selectList(category));
		if(category.equals("share")||category.equals("request")) {
			mav.setViewName("board/shareAndReqList");
		}
		mav.addObject("shareVO", service.selectCategory(category));
		return  mav;
	}

	@GetMapping("shareAndReqWrite")
	public ModelAndView shareAndReqWrite() {
		mav.setViewName("board/shareAndReqWrite");
		return mav;
	}

	@GetMapping("shareAndReqView")
	public ModelAndView shareAndReqView() {
		mav.setViewName("board/shareAndReqView");
		return mav;
	}
	
	@PostMapping("shareAndReqWriteOk")
	public ResponseEntity<String> shareAndReqWriteOk(BoardVO vo, HttpServletRequest request){
		// 현재 session에 있는 ID 구하기
		vo.setUserid((String)request.getSession().getAttribute("logId")); 

		// 결과를 return할 페이지 구조 
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		
		// 파일을 업로드할 폴더 절대경로
		String path = request.getSession().getServletContext().getRealPath("/upload");
		try { 
			// 파일 업로드 성공
			RelateUploadImgFile.fileRenameAndUpload(vo, path, request);
			// 업로드 성공(DB에 레코드 등록)
			service.shareAndReqInsert(vo);
			String msg = "<script>alert('🟢 글이 등록되었습니다.'); location.href='/board/shareAndReqView';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			// 데이터가 DB에 정상적으로 들어가지 않았다면 이미 업로드한 파일은 upload 폴더에 들어갔기 때문에 삭제해야 한다.
			// 삭제할 파일명은 vo안에 있고, fileDelete 메서드를 이용해서 삭제
			RelateUploadImgFile.fileDelete(path, vo.getThumbnailImg());
			RelateUploadImgFile.fileDelete(path, vo.getImg1());
			RelateUploadImgFile.fileDelete(path, vo.getImg2());
			RelateUploadImgFile.fileDelete(path, vo.getImg3());
			
			String msg ="<script>alert('🚫 글 등록에 실패했습니다.'); location.href=history.go(-1);</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	
	@GetMapping("rentAndSaleList")
	public ModelAndView priceListForm(String category) {
		mav.addObject("list", service.selectList(category));
		if(category.equals("rent") || category.equals("sale")) {
			mav.setViewName("board/rentAndSaleList");
		}
		return  mav;
	}

}
