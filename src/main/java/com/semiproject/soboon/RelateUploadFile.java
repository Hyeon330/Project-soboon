package com.semiproject.soboon;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.semiproject.soboon.vo.BoardVO;

public class RelateUploadFile {


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
		if (files != null) {
			int cnt = 1; // 업로드 순서에 따라 이름 짓기

			// 첨부파일 수 만큼 반복 업로드
			for (int i = 0; i < files.size(); i++) {
				MultipartFile mpf = files.get(i); // multipartfile 객체로 files에 있는 값 얻어오기
				String orgFileName = mpf.getOriginalFilename(); // 실제 파일명

				if (orgFileName != null && !orgFileName.equals("")) { // original 파일이 있으면 rename
					File f = new File(path, orgFileName); // 파일 객체로 경로와 실제 파일명 얻어오기

					// 파일이 존재하는지 확인(true이면 파일 존재, false이면 파일 존재하지 않음)
					if (f.exists()) {
						for (int renameNum = 1;; renameNum++) {
							int point = orgFileName.lastIndexOf("."); // .으로 확장자 파일 분리
							String filename = orgFileName.substring(0, point); // 파일명
							String ext = orgFileName.substring(point + 1); // 확장자

							// 새로 rename 하기
							f = new File(path, filename+ "(" + renameNum +")." + ext);
							if (!f.exists()) {
								orgFileName = f.getName();
								break;
							}
						}
					}
					// 파일 업로드 하기
					mpf.transferTo(f); // 업로드 발생
					if (cnt == 1)
						vo.setThumbnailImg(orgFileName);
					if (cnt == 2)
						vo.setImg1(orgFileName);
					if (cnt == 3)
						vo.setImg2(orgFileName);
					if (cnt == 4)
						vo.setImg3(orgFileName);
					cnt++;
				}
			}
		}
	}

	public static void fileRenameAndUpdate(BoardVO vo,  String path, List<String> fileList, List<String> newFileList, HttpServletRequest request) throws IOException {
		
		// 새로 업로드 하기
		MultipartHttpServletRequest mp = (MultipartHttpServletRequest)request;

		// 새로 업로드된 MultipartFile 객체를 얻어 오기(shareAndReqEdit에서의 name)
		List<MultipartFile> files = mp.getFiles("fileImg");
		System.out.println(files.size());
		if (files != null) {

			for (int i = 0; i < files.size(); i++) { // 업로드할 파일만큼 for문 실행
				// rename 하기
				MultipartFile mpf = files.get(i);
				// 새로운 파일명 newUploadFileName
				String newUploadFileName = mpf.getOriginalFilename();

				if (newUploadFileName != null && !newUploadFileName.equals("")) {
					// 있으면 rename하고 없으면 안하기
					File f = new File(path, newUploadFileName);

					// 파일이 존재할 때 rename
					if (f.exists()) {
						for (int n = 1;; n++) {
							int point = newUploadFileName.lastIndexOf(".");
							String newFileName = newUploadFileName.substring(0, point);
							String ext = newUploadFileName.substring(point + 1);

							// 새로 rename
							String newf = newFileName + "(" + n + ")." + ext;
							f = new File(path, newf);
							if (!f.exists()) {
								newUploadFileName = newf;
								break;
							}
						}
					}
					try {
						System.out.println(f.getName());
						// 파일 업로드
						mpf.transferTo(f); // 업로드!!
					}catch(Exception e) {e.printStackTrace();}
						fileList.add(newUploadFileName); // DB에 등록
						newFileList.add(newUploadFileName); // 새로운 업로드 목록 추가
				}
			}
		}

		// fileList에 있는 DB에 등록할 파일을 vo에 담기
		for (int fl = 0; fl < fileList.size(); fl++) {
			if(vo!=null) {
				if (fl == 0)
					vo.setThumbnailImg(fileList.get(fl));
				if (fl == 1)
					vo.setImg1(fileList.get(fl));
				if (fl == 2)
					vo.setImg2(fileList.get(fl));
				if (fl == 3)
					vo.setImg3(fileList.get(fl));
			}
		}
	}
	
	
}

