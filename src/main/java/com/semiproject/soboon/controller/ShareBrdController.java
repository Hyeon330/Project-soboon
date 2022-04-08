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

import com.semiproject.soboon.RelateUploadFile;
import com.semiproject.soboon.service.ShareBrdService;
import com.semiproject.soboon.vo.BoardVO;

@RequestMapping("/shareBoard/")
@RestController
public class ShareBrdController {
	
	@Inject
	ShareBrdService service;
	
	ModelAndView mav = new ModelAndView();
	ResponseEntity<String> entity = null;
	
	@GetMapping("shareList")
	public ModelAndView shareForm() {
		mav.setViewName("shareBoard/shareList");
		return  mav;
	}
	
	@GetMapping("shareWrite")
	public ModelAndView shareWrite() {
		mav.setViewName("shareBoard/shareWrite");
		return mav;
	}

	@PostMapping("shareWriteOk")
	public ResponseEntity<String> shareWriteOk(BoardVO vo, HttpServletRequest request){
		// 현재 session에 있는 ID 구하기
		vo.setUserid((String)request.getSession().getAttribute("logId")); 
		// 현재 카테고리 설정
		vo.setCategory("나눔");

		// 결과를 return할 페이지 구조 
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		
		// 파일을 업로드할 폴더 절대경로
		String path = request.getSession().getServletContext().getRealPath("/upload");
		
		try { 
			// 파일 업로드 성공
			RelateUploadFile.fileRenameAndUpload(vo, path, request);
			// 업로드 성공(DB에 레코드 등록)
			service.shareInsert(vo);
			String msg = "<script>alert('🟢 글이 등록되었습니다.'); location.href='/shareBoard/shareView';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			// 데이터가 DB에 정상적으로 들어가지 않았다면 이미 업로드한 파일은 upload 폴더에 들어갔기 때문에 삭제해야 한다.
			// 삭제할 파일명은 vo안에 있고, fileDelete 메서드를 이용해서 삭제
			RelateUploadFile.fileDelete(path, vo.getThumbnailImg());
			RelateUploadFile.fileDelete(path, vo.getImg1());
			RelateUploadFile.fileDelete(path, vo.getImg2());
			RelateUploadFile.fileDelete(path, vo.getImg3());
			
			String msg ="<script>alert('🚫 글 등록에 실패했습니다.'); location.href=history.go(-1);</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@GetMapping("shareView")
	public ModelAndView shareView() {
		mav.setViewName("shareBoard/shareView");
		return mav;
	}
}
