package com.listen.chatting.vo;

public class ChattingVo {
	private String chatting_seq; 

	private String chatting_name; 
	private String ramdom_name;
	private String email;
	private String reg_ip;
	private int members_seq;

	public String getReg_ip() {
		return reg_ip;
	}

	public void setReg_ip(String reg_ip) {
		this.reg_ip = reg_ip;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRamdom_name() {
		return ramdom_name;
	}

	public void setRamdom_name(String ramdom_name) {
		this.ramdom_name = ramdom_name;
	}

	public int getMembers_seq() {
		return members_seq;
	}

	public void setMembers_seq(int members_seq) {
		this.members_seq = members_seq;
	}

	public String getChatting_seq() {
		return chatting_seq;
	}

	public void setChatting_seq(String chatting_seq) {
		this.chatting_seq = chatting_seq;
	}

	public String getChatting_name() {
		return chatting_name;
	}

	public void setChatting_name(String chatting_name) {
		this.chatting_name = chatting_name;
	}
}
