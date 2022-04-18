package com.semiproject.soboon.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.semiproject.soboon.dao.MemberDAO;
import com.semiproject.soboon.vo.EmailVO;
import com.semiproject.soboon.vo.MemberVO;
import com.semiproject.soboon.vo.PagingVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberServiceImpl implements MemberService{

	@Inject
	MemberDAO dao;
	@Autowired
	JavaMailSender mailSender;
	
	@Override
	public int memberInsert(MemberVO vo) {
		System.out.println("vo="+vo);
		return dao.memberInsert(vo);
	}

	@Override
	public int idCheck(String userid) {
		return dao.idCheck(userid);
	}

	@Override	
	public int nicknameCheck(String nickname) {
		return dao.nicknameCheck(nickname);
	}

	@Override
	public MemberVO loginCheck(MemberVO vo) {
		return dao.loginCheck(vo);
	}

	@Override
	public int totalRecord(PagingVO pVO) {
		return dao.totalRecord(pVO);
	}

	@Override
	public List<MemberVO> memberList(PagingVO pVO) {
		return dao.MemberList(pVO);
	}
	
	@Override
	public int emailCheck(String email) {
		return dao.emailCheck(email);
	}

	@Override
	public int getMembercnt() {
		return dao.getMembercnt();
	}
	
	//문자인증
	public void telCheck(String tel, String ckNum) {
		String api_key = "NCSC9AFRRPOPNXPX";
		String api_secret = "JN5HV6JCETIXJW1VHMQRIOQOJWZQV3DE";
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String> params = new HashMap<>();
		params.put("to", tel);
		params.put("from", "01028264294");
		params.put("type", "SMS");
		params.put("text", "소분소분 인증번호 " + "["+ckNum+"]"+"를 입력하세요.");
		params.put("app_version", "test app 1.2");
		
		try {
			JSONObject obj = (JSONObject)coolsms.send(params);
			/* System.out.println(obj.toString()); */
		} catch(CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}

	@Override
	public String searchid_tel(String username,String tel) {
		return dao.searchid_tel(username,tel);
	}

	@Override
	public String searchid_email(String username,String email) {
		return dao.searchid_email(username,email);
	}
	
	@Override
	public void updateMyAddr(MemberVO vo) {
		dao.updateMyAddr(vo);
	}
	
	//---------------------------------------임시 비밀번호 설정---------------------------------
	//매일 내용을 생성하고 임시 비밀번호로 회원 비밀번호를 변경
//	@Override
//	public EmailVO createNewPwd(String email) {
//		String str = getTempPwd();
//		EmailVO evo = new EmailVO();
//		evo.setAddress(email);
//		evo.setTitle("소분소분 임시 비밀번호 안내 이메일 입니다.");
//		evo.setMessage("안녕하세요. 소분소분 임시 비밀번호 안내 관련 이메일 입니다." + "회원님의 임시 비밀번호는 " 
//						+ str + " 입니다. \n로그인 후에 비밀번호를 변경해주세요.");
//		updatePwd(str,email);
//		return evo;
//	}
//	
//	//임시 비밀번호로 업데이트
//	@Override
//	public void updatePwd(String str, String email) {
//		String pwd = str;
//		int id = dao.emailCheck(email);
//		if(id==0) {
//			
//		}
//	
//	}
//	
//	//랜덤함수로 임시 비밀번호 구문 만들기
//	@Override
//	public String getTempPwd() {
//		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 
//				'A', 'B', 'C', 'D', 'E', 'F','G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 
//				'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
//        String str = "";
//        
//        //문자 배열 길이의 값을 랜덤으로 8개를 뽑아 구문을 작성
//        int idx = 0;
//        for(int i = 0; i < 8; i++) {
//        	idx = (int)(charSet.length * Math.random());
//        	str += charSet[idx];
//        }
//        return str;
//	}
//	
//	//메일보내기
//	@Override
//	public void mailSend(EmailVO evo) {
//		System.out.println("전송완료오");
//		SimpleMailMessage message = new SimpleMailMessage();
//		message.setTo(evo.getAddress());
//		message.setSubject(evo.getTitle());
//		message.setText(evo.getMessage());
//		message.setFrom("yoyoyo066@naver.com");
//		message.setReplyTo("yoyoyo066@naver.com");
//		System.out.println("message-> " + message);
//		mailSender.send(message);
//	}
}
