package com.semiproject.soboon.vo;

public class ChatVO {
	private int chatno;
	private String sender;
	private String receiver;
	private String msg;
	private String chat_datetime;
	private String chat_read;
	
	private String s_nickname;
	private String r_nickname;
	
	@Override
	public String toString() {
		return "ChatVO [getChatno()=" + getChatno() + ", getSender()=" + getSender() + ", getReceiver()="
				+ getReceiver() + ", getMsg()=" + getMsg() + ", getDatetime()=" + getChat_datetime() + ", getChat_read()="
				+ getChat_read() + ", getS_nickname()=" + getS_nickname() + ", getR_nickname()=" + getR_nickname()
				+ "]";
	}
	
	public int getChatno() {
		return chatno;
	}
	public void setChatno(int chatno) {
		this.chatno = chatno;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getChat_datetime() {
		return chat_datetime;
	}
	public void setChat_datetime(String chat_datetime) {
		this.chat_datetime = chat_datetime;
	}
	public String getChat_read() {
		return chat_read;
	}
	public void setChat_read(String chat_read) {
		this.chat_read = chat_read;
	}
	public String getS_nickname() {
		return s_nickname;
	}
	public void setS_nickname(String s_nickname) {
		this.s_nickname = s_nickname;
	}
	public String getR_nickname() {
		return r_nickname;
	}
	public void setR_nickname(String r_nickname) {
		this.r_nickname = r_nickname;
	}
}
