package com.listen.chatting.vo;

import java.util.ArrayList;

public class ChattingMemberVo {
	private String email;
	private String chatting_seq;
	private String chatting_name;
	private String ramdom_name;
	private String random_name1;
	private String random_name2;
	private String members_seq;

	public String getChatting_seq() {
		return chatting_seq;
	}
	public void setChatting_seq(String chatting_seq) {
		this.chatting_seq = chatting_seq;
	}
	public String getMembers_seq() {
		return members_seq;
	}
	public void setMembers_seq(String members_seq) {
		this.members_seq = members_seq;
	}
	public String getRamdom_name() {
		return ramdom_name;
	}
	public void setRamdom_name(String ramdom_name) {
		this.ramdom_name = ramdom_name;
	}
	public String getRandom_name2() {
		return random_name2;
	}
	public void setRandom_name2(String random_name2) {
		this.random_name2 = random_name2;
	}
	public String getRandom_name1() {
		return random_name1;
	}
	public void setRandom_name1(String random_name1) {
		this.random_name1 = random_name1;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getChatting_name() {
		return chatting_name;
	}
	public void setChatting_name(String chatting_name) {
		this.chatting_name = chatting_name;
	}

}
