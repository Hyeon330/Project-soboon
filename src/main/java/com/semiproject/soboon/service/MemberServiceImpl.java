package com.semiproject.soboon.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.semiproject.soboon.dao.MemberDAO;
import com.semiproject.soboon.vo.MemberVO;
import com.semiproject.soboon.vo.PagingVO;
import com.semiproject.soboon.vo.ReportVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MemberServiceImpl implements MemberService{

	@Inject
	MemberDAO dao;
	
	@Override
	public int memberInsert(MemberVO vo) {
		return dao.memberInsert(vo);
	}
	
	@Override
	public MemberVO readMember(String userid) {
		return dao.readMember(userid);
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

	@Override
	public int updatePwd(MemberVO vo) {
		return dao.updatePwd(vo);
	}

	@Override
	public int memberMultiDelete(MemberVO vo) {
		return dao.memberMultiDelete(vo);
		
	}
	@Override
	public void updateWarn(ReportVO rVO) {
		dao.updateWarn(rVO);
	}
}
