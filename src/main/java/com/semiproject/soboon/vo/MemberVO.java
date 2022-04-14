package com.semiproject.soboon.vo;

public class MemberVO {
	private String userid;
	private String userpwd;
	private String username;
	
	private String tel;
	private String tel1;
	private String tel2;
	private String tel3;
	
	private String large;
	private String medium;
	private String small;
	
	private String nickname;
	private String email;
	private int warn;
	private int verify;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTel() {
		tel = tel1+"-"+tel2+"-"+tel3;
		return tel;
	}
	public void setTel(String tel) {
		String tels[] = tel.split("-");
		tel1 = tels[0];
		tel2 = tels[1];
		tel3 = tels[2];
		this.tel = tel;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getWarn() {
		return warn;
	}
	public void setWarn(int warn) {
		this.warn = warn;
	}
	public int getVerify() {
		return verify;
	}
	public void setVerify(int verify) {
		this.verify = verify;
	}
	public String getLarge() {
		return large;
	}
	public void setLarge(String large) {
		this.large = large;
	}
	public String getMedium() {
		return medium;
	}
	public void setMedium(String medium) {
		this.medium = medium;
	}
	public String getSmall() {
		return small;
	}
	public void setSmall(String small) {
		this.small = small;
	}
}
