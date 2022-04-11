package com.semiproject.soboon;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.semiproject.soboon.vo.BoardVO;

public class RelateUploadImgFile {

	public static void fileDelete(String path, String files) {
		if(files!=null) { // 파일이 존재하면
			File file = new File(path, files); // 파일 객체 생성
			file.delete();
		}
	}
	
	public static void fileRenameAndUpload(BoardVO vo, String path, HttpServletRequest request) throws IOException {
		
		// 파일업로드를 처리하기 위해서 request객체에서 multipart객체로 형변환
		MultipartHttpServletRequest mp = (MultipartHttpServletRequest)request;
		
		// sharewrite.jsp에서 name="fileImg" 
		// mp에 파일의 수만큼 MultipartFile 객체 존재
		List<MultipartFile> files = mp.getFiles("fileImg");
		
		// 파일 rename
		if(files!=null) { 
			int cnt = 1;  // 업로드 순서에 따라 이름 짓기
			
			// 첨부파일 수 만큼 반복 업로드
			for(int i=0; i<files.size(); i++) {
				MultipartFile mpf = files.get(i); // multipartfile 객체로 files에 있는 값 얻어오기
				String orgFileName = mpf.getOriginalFilename(); // 실제 파일명
				
				if(orgFileName!=null && !orgFileName.equals("")) { //original 파일이 있으면 rename
					File f = new File(path, orgFileName); // 파일 객체로 경로와 실제 파일명 얻어오기
					
				    // 파일이 존재하는지 확인(true이면 파일 존재, false이면 파일 존재하지 않음)
					if(f.exists()) {
						for(int renameNum=1;;renameNum++) {
							int point = orgFileName.lastIndexOf("."); // .으로 확장자 파일 분리
							String filename = orgFileName.substring(0,point); // 파일명
							String ext = orgFileName.substring(point+1); // 확장자
							
							// 새로 rename 하기 
							f = new File(path, filename + "[" + renameNum + "]" + ext);
							if(!f.exists()) { // 
								orgFileName = f.getName();
								break;
							}
						}
					}
					// 파일 업로드 하기
					mpf.transferTo(f); // 업로드 발생
					if(cnt==1) vo.setThumbnailImg(orgFileName);
					if(cnt==2) vo.setImg1(orgFileName);
					if(cnt==3) vo.setImg2(orgFileName);
					if(cnt==4) vo.setImg3(orgFileName);
					cnt++;
				}
			}
		}
	}
}
