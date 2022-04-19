package com.semiproject.soboon.vo;

import java.util.List;

public class ReplyVO {

	private int replyno;
	private int warn;
	private int no;
	private String userid;
	private String nickname;
	private String coment;
	private String createdate;
	private String title;
	
	// replyno 체크박스 모을 수 있는 리스트 객체 생성
	private List<Integer> replynoList;
	
	public int getReplyno() {
		return replyno;
	}
	public void setReplyno(int replyno) {
		this.replyno = replyno;
	}
	public int getWarn() {
		return warn;
	}
	public void setWarn(int warn) {
		this.warn = warn;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getComent() {
		return coment;
	}
	public void setComent(String coment) {
		this.coment = coment;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public List<Integer> getReplynoList() {
		return replynoList;
	}
	public void setReplynoList(List<Integer> replynoList) {
		this.replynoList = replynoList;
	}
	
}
