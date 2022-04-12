package com.semiproject.soboon.vo;

public class ChatVO {
	private int chatno;
	private String sender;
	private String receiver;
	private String msg;
	private String chat_datetime;
	private String chat_read;
	
	@Override
	public String toString() {
		return "ChatVO [getChatno()=" + getChatno() + ", getSender()=" + getSender() + ", getReceiver()="
				+ getReceiver() + ", getMsg()=" + getMsg() + ", getChat_datetime()=" + getChat_datetime()
				+ ", getChat_read()=" + getChat_read() + "]";
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
}