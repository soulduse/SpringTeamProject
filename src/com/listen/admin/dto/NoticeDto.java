package com.listen.admin.dto;

public class NoticeDto {

	private int bbs_seq;
	private int bbs_info_seq;
	private int members_seq;
	private String bbs_title;
	private String bbs_contents;
	private String reg_email;
	private String reg_ip;

	public int getBbs_seq() {
		return bbs_seq;
	}

	public void setBbs_seq(int bbs_seq) {
		this.bbs_seq = bbs_seq;
	}

	public int getBbs_info_seq() {
		return bbs_info_seq;
	}

	public void setBbs_info_seq(int bbs_info_seq) {
		this.bbs_info_seq = bbs_info_seq;
	}

	public int getMembers_seq() {
		return members_seq;
	}

	public void setMembers_seq(int members_seq) {
		this.members_seq = members_seq;
	}

	public String getBbs_title() {
		return bbs_title;
	}

	public void setBbs_title(String bbs_title) {
		this.bbs_title = bbs_title;
	}

	public String getBbs_contents() {
		return bbs_contents;
	}

	public void setBbs_contents(String bbs_contents) {
		this.bbs_contents = bbs_contents;
	}

	public String getReg_email() {
		return reg_email;
	}

	public void setReg_email(String reg_email) {
		this.reg_email = reg_email;
	}

	public String getReg_ip() {
		return reg_ip;
	}

	public void setReg_ip(String reg_ip) {
		this.reg_ip = reg_ip;
	}

}
