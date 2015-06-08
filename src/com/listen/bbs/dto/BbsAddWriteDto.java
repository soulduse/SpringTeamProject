package com.listen.bbs.dto;

public class BbsAddWriteDto {

	private String bbs_add_seq;
	private String bbs_seq;
	private String content;
	private String reg_email;
	private String reg_ip;

	public String getBbs_add_seq() {
		return bbs_add_seq;
	}

	public void setBbs_add_seq(String bbs_add_seq) {
		this.bbs_add_seq = bbs_add_seq;
	}

	public String getBbs_seq() {
		return bbs_seq;
	}

	public void setBbs_seq(String bbs_seq) {
		this.bbs_seq = bbs_seq;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
