package com.semiproject.soboon.controller;

import java.io.File;
import java.nio.charset.Charset;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.semiproject.soboon.vo.BoardVO;

@RequestMapping("/shareBoard/")
@RestController
public class ShareBrdController {
	
	ModelAndView mav = new ModelAndView();
	ResponseEntity<String> entity = null;
	
	@GetMapping("shareList")
	public ModelAndView shareForm() {
		mav.setViewName("shareBoard/shareList");
		return  mav;
	}
	
	@GetMapping("shareView")
	public ModelAndView shareView() {
		mav.setViewName("shareBoard/shareView");
		return mav;
	}
	
	@GetMapping("shareWrite")
	public ModelAndView shareWrite() {
		mav.setViewName("shareBoard/shareWrite");
		return mav;
	}

	@PostMapping("shareWriteOk")
	public ResponseEntity<String> shareWriteOk(BoardVO vo, HttpServletRequest request){
		// 현재 session에 있는 ID 구하기
		vo.setUserid((String)request.getSession().getAttribute("logID")); 
		
		// 결과를 return할 페이지 구조 
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text", "html", Charset.forName("UTF-8")));
		
		// 파일(이미지)업로드를 위한 업로드 위치의 절대주소(upload 폴더)
		String path = request.getSession().getServletContext().getRealPath("/upload");
		//System.out.println(path);
		
		try { // 파일 업로드 성공
			MultipartHttpServletRequest mp = (MultipartHttpServletRequest)request;
			List<MultipartFile> files = mp.getFiles("fileImg");
			//System.out.println("업로드한 파일 수 "  + files.size());
			
			
//			if(files!=null) { // 파일 rename
//				int cnt = 1; 
//				
//				// 첨부파일 수 만큼 반복 업로드
//				for(int i=0; i<files.size(); i++) {
//					MultipartFile mpf = files.get(i); // multipartfile 객체로 files에 있는 값 얻어오기
//					String orgFileName = mpf.getOriginalFilename(); // 실제 파일명
//					System.out.println(orgFileName);
//					if(orgFileName!=null && !orgFileName.equals("")) { //original파일이 있으면 rename
//						File f = new File(path, orgFileName); // 파일 객체로 경로와 실제 파일명 얻어오기
//						
//					    // 파일이 존재하는지 확인
//						if(f.exists()) {
//							for(int renameNum=1;;renameNum++) {
//								int point = orgFileName.lastIndexOf("."); // .으로 확장자 파일 분리
//								String filename = orgFileName.substring(0,point); // 파일명
//								String ext = orgFileName.substring(point+1); // 확장자
//								
//								// 새로 rename 하기 
//								f = new File(path, filename + "(" + renameNum + ")" + ext);
//							}
//						}
//					}
//				}
//			}
		}catch(Exception e) {
			e.printStackTrace();
			entity = null;
		}
		return entity;
	}
}
